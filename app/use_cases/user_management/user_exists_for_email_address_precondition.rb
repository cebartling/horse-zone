module UserManagement
  class UserExistsForEmailAddressPrecondition
    attr_reader :message

    def self.symbol
      :user_exists_for_email_address
    end

    def satisfied?(params)
      result = true
      unless User.find_by_email_address(params.email_address)
        @message = "User email address '#{params.email_address}' does not point to a valid user record in the database."
        result = false
      end
      result
    end
  end
end
