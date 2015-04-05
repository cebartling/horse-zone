require_relative 'tenant_management'

module TenantManagement
  class RetrieveTenantsInput
    include Virtus.model
  end

  class RetrieveTenantsCommand
    def execute(_params)
      Tenant.all
    end
  end

  class RetrieveTenants
    include UseCase

    def initialize
      input_class(TenantManagement::RetrieveTenantsInput)
      step(TenantManagement::RetrieveTenantsCommand.new)
    end
  end
end
