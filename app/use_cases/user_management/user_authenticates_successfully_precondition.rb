module UserManagement
  class UserAuthenticatesSuccessfullyPrecondition
    attr_reader :message

    def self.symbol
      :user_authenticates_successfully
    end

    def satisfied?(params)
      result = true
      user = User.find_by_email_address(params.email_address)
      authenticated_user = user.try(:authenticate, params.password)
      unless authenticated_user
        @message = "User '#{params.email_address}' could not be authenticated using the supplied password."
        result = false
      end
      result
    end
  end
end
