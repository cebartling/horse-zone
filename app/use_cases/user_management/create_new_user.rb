require_relative 'validators'
require_relative 'pre_conditions'

module UserManagement
  class CreateNewUserInput
    include Virtus.model

    attribute :email, String
    attribute :password, String
  end

  class CreateNewUserCommand
    def execute(params)
      new_user = User.new(email: params.email, password: params.password)
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
