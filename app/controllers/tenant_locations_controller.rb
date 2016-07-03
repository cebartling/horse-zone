class TenantLocationsController < ApplicationController
  before_action :set_tenant_location, only: [:show, :update, :destroy]

  # GET /tenant_locations
  def index
    @tenant_locations = TenantLocation.all

    render json: @tenant_locations
  end

  # GET /tenant_locations/1
  def show
    render json: @tenant_location
  end

  # POST /tenant_locations
  def create
    @tenant_location = TenantLocation.new(tenant_location_params)

    if @tenant_location.save
      render json: @tenant_location, status: :created, location: @tenant_location
    else
      render json: @tenant_location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tenant_locations/1
  def update
    if @tenant_location.update(tenant_location_params)
      render json: @tenant_location
    else
      render json: @tenant_location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tenant_locations/1
  def destroy
    @tenant_location.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant_location
      @tenant_location = TenantLocation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tenant_location_params
      params.fetch(:tenant_location, {})
    end
end
