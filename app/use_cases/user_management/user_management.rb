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

  class UserExistsForEmailAddressPrecondition
    attr_reader :message

    def satisfied?(params)
      result = true
      unless User.find_by_email_address(params.email_address)
        @message = "User email address '#{params.email_address}' does not point to a valid user record in the database."
        result = false
      end
      result
    end
  end

  class UserAuthenticatesSuccessfullyPrecondition
    attr_reader :message

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

  class TenantExistsPrecondition
    attr_reader :message

    def satisfied?(params)
      Tenant.find(params.tenant_id)
      true
    rescue
      @message = "Tenant identifier '#{params.tenant_id}' does not point to a valid tenant record in the database."
      false
    end
  end

  NewUserValidator = UseCase::Validator.define do
    validates_presence_of :email_address
    validates_presence_of :password
  end

  SignInUserValidator = UseCase::Validator.define do
    validates_presence_of :email_address
    validates_presence_of :password
  end

  UpdateUserValidator = UseCase::Validator.define do
    validates_presence_of :id
  end

  DeleteExistingUserValidator = UseCase::Validator.define do
    validates_presence_of :id
  end
end
