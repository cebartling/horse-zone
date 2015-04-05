require_relative 'user_management'

module UserManagement
  class SignInUserInput
    include Virtus.model

    attribute :email, String
    attribute :password, String
  end

  class SignInUserCommand
    def execute(params)
      user = User.find_by(email: params.email)
      authenticated = user.try(:authenticate, params.password)
      if authenticated
        user.sign_in_count += 1
        user.save
      end
      authenticated
    end
  end

  class SignInUser
    include UseCase

    def initialize
      input_class(UserManagement::SignInUserInput)
      step(UserManagement::SignInUserCommand.new, validators: [UserManagement::SignInUserValidator])
    end
  end
end
