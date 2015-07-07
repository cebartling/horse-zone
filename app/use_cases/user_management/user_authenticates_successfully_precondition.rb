module UserManagement
  class UserAuthenticatesSuccessfullyPrecondition
    attr_reader :message

    def self.symbol
      :user_authenticates_successfully
    end

    def satisfied?(params)
      user = User.find_by_email(params.email_address)
      is_authenticated = user.valid_password?(params.password)
      unless is_authenticated
        @message = "User '#{params.email_address}' could not be authenticated using the supplied password."
      end
      is_authenticated
    end
  end
end
