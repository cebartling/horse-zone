class Api::V1::UsersController < ApplicationController

  before_filter :authenticate_user!

  respond_to :json

  def index
    outcome = RetrieveUsers.new(current_user).execute(params)
    outcome.success { |users| @users = users }
  end

  def show
    outcome = RetrieveUser.new(current_user).execute(params)
    outcome.success { |user| @user = user }
  end

  def create

  end

  def update

  end

  def destroy

  end

end
