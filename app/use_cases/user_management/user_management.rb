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
