require_relative 'tenant_management'

module TenantManagement
  class UpdateExistingTenantInput
    include Virtus.model

    attribute :name, String
    attribute :id, String
  end

  class UpdateExistingTenantCommand
    def execute(params)
      tenant = Tenant.find(params.id)
      if tenant
        tenant.name = params.name if params.name
        tenant.save!
      end
      tenant
    end
  end

  class UpdateExistingTenant
    include UseCase

    def initialize
      input_class(TenantManagement::UpdateExistingTenantInput)
      add_pre_condition(TenantManagement::TenantExistsPrecondition.new)
      step(TenantManagement::UpdateExistingTenantCommand.new, validators: [TenantManagement::UpdateTenantValidator])
    end
  end
end
