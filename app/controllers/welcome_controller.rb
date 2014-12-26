class WelcomeController < ApplicationController

  before_action :authenticate_user!

  def index
    render view: 'index', layout: 'authenticated-application'
  end

end
