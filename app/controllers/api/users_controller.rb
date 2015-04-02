class Api::UsersController < ApplicationController

  respond_to :json

  def index
    @users = []
  end

  def create
    # user = User.new
    respond_to do |format|
      # if user.errors
      #   format.json { render json: user, status: :created, location: user }
        format.json { render json: {}, status: :created }
      # else
      #   format.json { render json: user.errors, status: :unprocessable_entity }
      # end
    end
  end

  def update
    # user = User.new
    respond_to do |format|
      # if @inventory_item.update_attributes(params[:inventory_item])
      #   @inventory_item.service_provider= current_user.organization
      format.json { head :no_content }
      # else
      #   format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      # end
    end
  end

  def destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

end
