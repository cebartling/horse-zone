# == Route Map
#
#                   Prefix Verb   URI Pattern                      Controller#Action
#         new_user_session GET    /users/sign_in(.:format)         devise/sessions#new
#             user_session POST   /users/sign_in(.:format)         devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)        devise/sessions#destroy
#            user_password POST   /users/password(.:format)        devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)    devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)   devise/passwords#edit
#                          PATCH  /users/password(.:format)        devise/passwords#update
#                          PUT    /users/password(.:format)        devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)          devise/registrations#cancel
#        user_registration POST   /users(.:format)                 devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)         devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)            devise/registrations#edit
#                          PATCH  /users(.:format)                 devise/registrations#update
#                          PUT    /users(.:format)                 devise/registrations#update
#                          DELETE /users(.:format)                 devise/registrations#destroy
#                     root GET    /                                welcome#index
#             api_v1_users GET    /api/v1/users(.:format)          api/v1/users#index
#                          POST   /api/v1/users(.:format)          api/v1/users#create
#          new_api_v1_user GET    /api/v1/users/new(.:format)      api/v1/users#new
#         edit_api_v1_user GET    /api/v1/users/:id/edit(.:format) api/v1/users#edit
#              api_v1_user GET    /api/v1/users/:id(.:format)      api/v1/users#show
#                          PATCH  /api/v1/users/:id(.:format)      api/v1/users#update
#                          PUT    /api/v1/users/:id(.:format)      api/v1/users#update
#                          DELETE /api/v1/users/:id(.:format)      api/v1/users#destroy
#

Rails.application.routes.draw do
  devise_for :users

  root to: 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :users, defaults: {format: 'json'}
    end
  end

end
