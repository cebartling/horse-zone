module TenantManagement
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