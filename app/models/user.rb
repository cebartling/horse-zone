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


class RetrieveUsersInput
  include Virtus.model

end

# The business logic. Here we can safely assume that all pre-conditions are
# satisfied, and that input is valid and has the correct type.
class RetrieveUsersCommand

  def initialize
    # @user = user
  end

  # Params is an instance of RetrieveUsersInput
  def execute(params)
    User.all
  end

end

# The UseCase - this is just wiring together the various classes
class RetrieveUsers
  include UseCase

  # There's no contract to satisfy with the constructor - design it to receive
  # any dependencies you need.
  # def initialize(auth, user)
  def initialize
    input_class(RetrieveUsersInput)
    # add_pre_condition(UserLoggedInPrecondition.new(user))
    # add_pre_condition(ProjectAdminPrecondition.new(auth, user))
    # A step is comprised of a command with 0, 1 or many validators
    # (e.g. :validators => [...])
    # The use case can span multiple steps (see below)
    step(RetrieveUsersCommand.new)
  end
end
