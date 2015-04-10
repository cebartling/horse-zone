class Api::UsersController < ApplicationController

  respond_to :json

  def index
    outcome = UserManagement::RetrieveUsers.new.execute(params)

    outcome.failure do |model|
      respond_to do |format|
        format.json { render status: :unprocessable_entity, json: {} }
      end
    end

    outcome.success do |repository|
      @users = outcome.result
    end
  end

  def create
    outcome = UserManagement::CreateNewUser.new.execute(params)

    outcome.failure do |model|
      respond_to do |format|
        format.json { render status: :unprocessable_entity, json: {} }
      end
    end

    outcome.success do |user|
      @user = user
      respond_to do |format|
        format.json { head :created, location: api_user_path(@user) }
      end
    end
  end

  def update
    outcome = UserManagement::UpdateExistingUser.new.execute(params)

    outcome.failure do |model|
      respond_to do |format|
        format.json { render status: :unprocessable_entity, json: {} }
      end
    end

    outcome.success do |user|
      respond_to do |format|
        format.json { head :no_content }
      end
    end
  end

  def destroy
    outcome = UserManagement::DeleteExistingUser.new.execute(params)

    outcome.failure do |model|
      respond_to do |format|
        format.json { render status: :unprocessable_entity, json: {} }
      end
    end

    outcome.success do |user|
      respond_to do |format|
        format.json { head :no_content }
      end
    end
  end

end
