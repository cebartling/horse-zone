require_relative 'tenant_management'

module TenantManagement
  class CreateNewTenantInput
    include Virtus.model

    attribute :name, String
  end

  class CreateNewTenantCommand
    def execute(params)
      new_tenant = Tenant.new(name: params.name)
      new_tenant.save!
      new_tenant
    end
  end

  class CreateNewTenant
    include UseCase

    def initialize
      input_class(TenantManagement::CreateNewTenantInput)
      step(TenantManagement::CreateNewTenantCommand.new, validators: [TenantManagement::NewTenantValidator])
    end
  end
end
