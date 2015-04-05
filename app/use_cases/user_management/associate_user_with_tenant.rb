require_relative 'user_management'

module UserManagement
  class AssociateUserWithTenantInput
    include Virtus.model

    attribute :id, Integer
    attribute :tenant_id, Integer
  end

  class AssociateUserWithTenantCommand
    def execute(params)
      user = User.find(params.id)
      tenant = Tenant.find(params.tenant_id)
      if tenant && user
        user.tenants << tenant
        user.save!
      end
    end
  end

  class AssociateUserWithTenant
    include UseCase

    def initialize
      input_class(UserManagement::AssociateUserWithTenantInput)
      add_pre_condition(UserManagement::UserExistsPrecondition.new)
      add_pre_condition(UserManagement::TenantExistsPrecondition.new)
      step(UserManagement::AssociateUserWithTenantCommand.new)
    end
  end
end
