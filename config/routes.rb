Rails.application.routes.draw do

  root 'welcome#index'

  post 'authenticate' => 'authentication#authenticate'

  namespace :api do
    # Directs /api/users/* to Api::UsersController
    # (app/controllers/api/users_controller.rb)
    resources :users
  end
end
