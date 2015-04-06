require_relative 'user_management'

module UserManagement
  class SignInUserCommand
    def execute(params)
      authenticated_user = User.find_by_email_address(params.email_address)
      authenticated_user.sign_in_count += 1
      authenticated_user.save!
      authenticated_user
    end
  end

  class SignInUser
    include UseCase

    def initialize
      input_class(UserManagement::SignInUserInput)
      add_pre_condition(UserManagement::UserExistsForEmailAddressPrecondition.new)
      add_pre_condition(UserManagement::UserAuthenticatesSuccessfullyPrecondition.new)
      step(UserManagement::SignInUserCommand.new,
           validators: [UserManagement::SignInUserValidator])
    end
  end
end
