module UserManagement
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
end
