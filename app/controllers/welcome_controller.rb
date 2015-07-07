class WelcomeController < ApplicationController
  # skip_before_action :authenticate_request
  before_action :authenticate_user!

  def index
  end
end
