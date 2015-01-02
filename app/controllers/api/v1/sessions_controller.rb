class Api::V1::SessionsController < ApplicationController

  respond_to :json

  def create
    outcome = UserManagement::SignInUser.new.execute(params)
    outcome.success do |user|
      respond_to do |format|
        format.json { render status: :created, json: {success: true} }
      end
    end
    outcome.failure do |failure|
      respond_to do |format|
        format.json { render status: :unprocessable_entity, json: {success: false, errors: [failure.errors]} }
      end
    end
  end

end