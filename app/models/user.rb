# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

require 'use_case'
require 'virtus'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
end


# # This is often implemented as a controller filter in many Rails apps.
# # Unfortunately that means we have to duplicate the check when exposing the use
# # case in other contexts (e.g. a stand-alone API app, console API etc).
# class UserRequired
#
#   # The constructor is only used by us and can look and do whever we want
#   def initialize(user)
#     @user = user
#   end
#
#   # A pre-condition must define this method
#   # Params is an instance of NewRepositoryInput
#   def satisfied?(params)
#     !@user.nil?
#   end
# end


class RetrieveUsersInput
  include Virtus.model

end

class RetrieveUsersCommand

  def initialize(user)
    @user = user
  end

  # Params is an instance of RetrieveUsersInput
  def execute(params)
    User.all
  end

end

class RetrieveUsers
  include UseCase

  # There's no contract to satisfy with the constructor - design it to receive
  # any dependencies you need.
  # def initialize(auth, user)
  def initialize(user)
    input_class(RetrieveUsersInput)
    # add_pre_condition(UserRequired.new(user))
    # add_pre_condition(ProjectAdminPrecondition.new(auth, user))
    # A step is comprised of a command with 0, 1 or many validators
    # (e.g. :validators => [...])
    # The use case can span multiple steps (see below)
    step(RetrieveUsersCommand.new(user))
  end
end


class RetrieveUserInput
  include Virtus.model

  attribute :id, Integer
end

class RetrieveUserCommand

  def initialize(user)
    @user = user
  end

  def execute(params)
    User.find(params.id)
  end

end

class RetrieveUser
  include UseCase

  def initialize(user)
    input_class(RetrieveUserInput)
    # add_pre_condition(UserRequired.new(user))
    # add_pre_condition(ProjectAdminPrecondition.new(auth, user))
    # A step is comprised of a command with 0, 1 or many validators
    # (e.g. :validators => [...])
    # The use case can span multiple steps (see below)
    step(RetrieveUserCommand.new(user))
  end
end


class CreateNewUserInput
  include Virtus.model

  attribute :email, String
  attribute :password, String
end

class CreateNewUserCommand

  def initialize
  end

  def execute(params)
    new_user = User.new(email: params.email, password: params.password)
    new_user.save!
    new_user
  end

end

NewUserValidator = UseCase::Validator.define do
  validates_presence_of :email
  validates_presence_of :password
end


class CreateNewUser
  include UseCase

  def initialize
    input_class(CreateNewUserInput)
    # add_pre_condition(UserRequired.new(user))
    # add_pre_condition(ProjectAdminPrecondition.new(auth, user))
    # A step is comprised of a command with 0, 1 or many validators
    # (e.g. :validators => [...])
    # The use case can span multiple steps (see below)
    step(CreateNewUserCommand.new, validators: [NewUserValidator])
  end
end


class UpdateExistingUserInput
  include Virtus.model

  attribute :email, String
  attribute :password, String
  attribute :id, Integer
end

class UserExistsPrecondition
  attr_reader :message

  def satisfied?(params)
    User.find(params.id)
    true
  rescue
    @message = "User identifier '#{params.id}' does not point to a valid user record in the database."
    false
  end
end

class UpdateExistingUserCommand
  def execute(params)
    user = User.find(params.id)
    if user
      user.email = params.email if params.email
      user.password = params.password if params.password
      user.save!
    end
    user
  end
end

UpdateUserValidator = UseCase::Validator.define do
  validates_presence_of :id
end


class UpdateExistingUser
  include UseCase

  def initialize
    input_class(UpdateExistingUserInput)
    add_pre_condition(UserExistsPrecondition.new)
    step(UpdateExistingUserCommand.new, validators: [UpdateUserValidator])
  end
end



class DeleteExistingUserInput
  include Virtus.model

  attribute :id, Integer
end

class DeleteExistingUserCommand
  def execute(params)
    User.delete(params.id)
  end
end

DeleteExistingUserValidator = UseCase::Validator.define do
  validates_presence_of :id
end


class DeleteExistingUser
  include UseCase

  def initialize
    input_class(DeleteExistingUserInput)
    add_pre_condition(UserExistsPrecondition.new)
    step(DeleteExistingUserCommand.new, validators: [DeleteExistingUserValidator])
  end
end

