module UserManagement
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
end