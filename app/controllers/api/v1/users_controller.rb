class Api::V1::UsersController < ApplicationController

  def index
    outcome = RetrieveUsers.new.execute(params)
    # outcome.pre_condition_failed do |f|
    #   # f.when(:user_required) { redirect_to(login_path) }
    #   f.otherwise do
    #     # flash[:error] = "You're not allowed to do that"
    #     redirect_to project_path
    #   end
    # end

    # outcome.failure do |model|
    #   # Render form with validation errors
    #   render :new, :locals => { :repository => model }
    # end

    outcome.success do |users|
      @users = users
    end
  end

  def show

  end

  def create

  end

  def update

  end

  def destroy

  end

end
