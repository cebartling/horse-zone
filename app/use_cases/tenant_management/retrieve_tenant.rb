require_relative 'validators'
require_relative 'pre_conditions'

module TenantManagement

  class RetrieveTenantInput
    include Virtus.model

    attribute :id, Integer
  end

  class RetrieveTenantCommand
    def execute(params)
      if params.id
        Tenant.find(params.id)
      end
    end
  end

  class RetrieveTenant
    include UseCase

    def initialize()
      input_class(TenantManagement::RetrieveTenantInput)
      add_pre_condition(TenantManagement::TenantExistsPrecondition.new)
      step(TenantManagement::RetrieveTenantCommand.new)
    end
  end
end