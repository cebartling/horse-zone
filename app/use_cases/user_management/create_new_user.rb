require_relative 'validators'
require_relative 'pre_conditions'

module UserManagement
  class CreateNewUserInput
    include Virtus.model

    attribute :email_address, String
    attribute :password, String
    attribute :first_name, String
    attribute :last_name, String
  end

  class CreateNewUserCommand
    def execute(params)
      new_user = User.new(email_address: params.email_address, password: params.password)
      new_user.save!
      new_user
    end
  end

  class CreateNewUser
    include UseCase

    def initialize
      input_class(UserManagement::CreateNewUserInput)
      step(UserManagement::CreateNewUserCommand.new, validators: [UserManagement::NewUserValidator])
    end
  end
end
