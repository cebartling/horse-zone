class Api::V1::UsersController < ApplicationController

  before_action :authenticate_user!

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
    outcome = CreateNewUser.new.execute(params)
    outcome.success do |user|
      render nothing: true, status: :created, location: api_v1_user_path(user)
    end
    outcome.failure do |failure|
      respond_to do
        format.json { render status: :bad_request, json: {errors: ['something was wrong']} }
      end
    end
  end

  def update

  end

  def destroy

  end

end
