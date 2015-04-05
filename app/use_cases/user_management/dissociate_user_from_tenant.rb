require_relative 'user_management'

module UserManagement
  class DissociateUserFromTenantInput
    include Virtus.model

    attribute :id, Integer
    attribute :tenant_id, Integer
  end

  class DissociateUserFromTenantCommand
    def execute(params)
      user = User.find(params.id)
      tenant = Tenant.find(params.tenant_id)
      if tenant && user
        user.tenants.delete(tenant)
        tenant.users.delete(user)
      end
      user
    end
  end

  class DissociateUserFromTenant
    include UseCase

    def initialize
      input_class(UserManagement::DissociateUserFromTenantInput)
      add_pre_condition(UserManagement::UserExistsPrecondition.new)
      add_pre_condition(UserManagement::TenantExistsPrecondition.new)
      step(UserManagement::DissociateUserFromTenantCommand.new)
    end
  end
end
