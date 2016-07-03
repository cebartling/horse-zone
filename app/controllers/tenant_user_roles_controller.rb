class TenantUserRolesController < ApplicationController
  before_action :set_tenant_user_role, only: [:show, :update, :destroy]

  # GET /tenant_user_roles
  def index
    @tenant_user_roles = TenantUserRole.all

    render json: @tenant_user_roles
  end

  # GET /tenant_user_roles/1
  def show
    render json: @tenant_user_role
  end

  # POST /tenant_user_roles
  def create
    @tenant_user_role = TenantUserRole.new(tenant_user_role_params)

    if @tenant_user_role.save
      render json: @tenant_user_role, status: :created, location: @tenant_user_role
    else
      render json: @tenant_user_role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tenant_user_roles/1
  def update
    if @tenant_user_role.update(tenant_user_role_params)
      render json: @tenant_user_role
    else
      render json: @tenant_user_role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tenant_user_roles/1
  def destroy
    @tenant_user_role.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant_user_role
      @tenant_user_role = TenantUserRole.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tenant_user_role_params
      params.fetch(:tenant_user_role, {})
    end
end
