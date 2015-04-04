require_relative 'validators'
require_relative 'pre_conditions'

module TenantManagement

  class DeleteExistingTenantInput
    include Virtus.model

    attribute :id, Integer
  end

  class DeleteExistingTenantCommand
    def execute(params)
      Tenant.delete(params.id)
    end
  end

  class DeleteExistingTenant
    include UseCase

    def initialize
      input_class(TenantManagement::DeleteExistingTenantInput)
      add_pre_condition(TenantManagement::TenantExistsPrecondition.new)
      step(TenantManagement::DeleteExistingTenantCommand.new, validators: [TenantManagement::DeleteExistingTenantValidator])
    end
  end

end
