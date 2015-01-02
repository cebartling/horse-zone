class Api::V1::UsersController < ApplicationController

  respond_to :json

  def index
    outcome = UserManagement::RetrieveUsers.new(current_user).execute(params)
    outcome.success { |users| @users = users }
  end

  def show
    outcome = UserManagement::RetrieveUser.new(current_user).execute(params)
    outcome.success { |user| @user = user }
  end

  def create
    outcome = UserManagement::CreateNewUser.new.execute(params)
    outcome.success do |user|
      respond_to do |format|
        format.json { render nothing: true, status: :created, location: api_v1_user_path(user) }
      end
    end
    outcome.failure do |failure|
      respond_to do |format|
        format.json { render status: :unprocessable_entity, json: {errors: [failure.errors]} }
      end
    end
  end

  def update
    outcome = UserManagement::UpdateExistingUser.new.execute(params)
    outcome.pre_condition_failed do |failure|
      failure.otherwise do |pre_condition|
        respond_to do |format|
          format.json { render status: :bad_request, json: {errors: [pre_condition.message]} }
        end
      end
    end
    outcome.failure do |failure|
      respond_to do |format|
        format.json { render status: :bad_request, json: {errors: [failure.errors]} }
      end
    end
    outcome.success do |user|
      respond_to do |format|
        format.json { render nothing: true, status: :no_content }
      end
    end
  end

  def destroy
    outcome = UserManagement::DeleteExistingUser.new.execute(params)
    outcome.pre_condition_failed do |failure|
      failure.otherwise do |pre_condition|
        respond_to do |format|
          format.json { render status: :bad_request, json: {errors: [pre_condition.message]} }
        end
      end
    end
    outcome.failure do |failure|
      respond_to do |format|
        format.json { render status: :bad_request, json: {errors: [failure.errors]} }
      end
    end
    outcome.success do |user|
      respond_to do |format|
        format.json { render nothing: true, status: :no_content }
      end
    end
  end

end
