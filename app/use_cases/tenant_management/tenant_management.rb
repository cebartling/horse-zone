module TenantManagement

  NewTenantValidator = UseCase::Validator.define do
    validates_presence_of :name
  end

  UpdateTenantValidator = UseCase::Validator.define do
    validates_presence_of :id
  end

  DeleteExistingTenantValidator = UseCase::Validator.define do
    validates_presence_of :id
  end

  class TenantExistsPrecondition
    attr_reader :message

    def satisfied?(params)
      Tenant.find(params.id)
      true
    rescue
      @message = "Tenant identifier '#{params.id}' does not point to a valid tenant record in the database."
      false
    end
  end


end