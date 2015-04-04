require_relative 'validators'
require_relative 'pre_conditions'

module TenantManagement

  class RetrieveTenantsInput
    include Virtus.model

  end

  class RetrieveTenantsCommand
    def execute(params)
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