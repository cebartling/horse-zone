class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  respond_to :json

  def authenticate
    outcome = UserManagement::SignInUser.new.execute(params)

    outcome.pre_condition_failed do |f|
      f.when(:user_exists_for_email_address) {
        respond_to do |format|
          format.json {
            render json: {error: 'The supplied credentials could not be used to authenticate the current session.'},
                   status: :unauthorized
          }
        end
      }
      f.when(:user_authenticates_successfully) {
        respond_to do |format|
          format.json {
            render json: {error: 'The supplied credentials could not be used to authenticate the current session.'},
                   status: :unauthorized
          }
        end
      }
      f.otherwise {
        respond_to do |format|
          format.json {
            render json: {error: 'The supplied credentials could not be used to authenticate the current session.'},
                   status: :unauthorized
          }
        end
      }
    end

    outcome.failure do |input|
      respond_to do |format|
        format.json {
          render json: {error: 'The supplied credentials could not be used to authenticate the current session.'},
                 status: :unauthorized
        }
      end
    end

    outcome.success do |user|
      render json: {auth_token: user.generate_auth_token}, status: :ok
    end
  end

end
