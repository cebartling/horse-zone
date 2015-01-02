# == Route Map
#
#              Prefix Verb   URI Pattern                         Controller#Action
#                root GET    /                                   welcome#index
#        api_v1_users GET    /api/v1/users(.:format)             api/v1/users#index {:format=>"json"}
#                     POST   /api/v1/users(.:format)             api/v1/users#create {:format=>"json"}
#     new_api_v1_user GET    /api/v1/users/new(.:format)         api/v1/users#new {:format=>"json"}
#    edit_api_v1_user GET    /api/v1/users/:id/edit(.:format)    api/v1/users#edit {:format=>"json"}
#         api_v1_user GET    /api/v1/users/:id(.:format)         api/v1/users#show {:format=>"json"}
#                     PATCH  /api/v1/users/:id(.:format)         api/v1/users#update {:format=>"json"}
#                     PUT    /api/v1/users/:id(.:format)         api/v1/users#update {:format=>"json"}
#                     DELETE /api/v1/users/:id(.:format)         api/v1/users#destroy {:format=>"json"}
#     api_v1_sessions GET    /api/v1/sessions(.:format)          api/v1/sessions#index {:format=>"json"}
#                     POST   /api/v1/sessions(.:format)          api/v1/sessions#create {:format=>"json"}
#  new_api_v1_session GET    /api/v1/sessions/new(.:format)      api/v1/sessions#new {:format=>"json"}
# edit_api_v1_session GET    /api/v1/sessions/:id/edit(.:format) api/v1/sessions#edit {:format=>"json"}
#      api_v1_session GET    /api/v1/sessions/:id(.:format)      api/v1/sessions#show {:format=>"json"}
#                     PATCH  /api/v1/sessions/:id(.:format)      api/v1/sessions#update {:format=>"json"}
#                     PUT    /api/v1/sessions/:id(.:format)      api/v1/sessions#update {:format=>"json"}
#                     DELETE /api/v1/sessions/:id(.:format)      api/v1/sessions#destroy {:format=>"json"}
#

Rails.application.routes.draw do

  root to: 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :users, defaults: {format: 'json'}
      resources :sessions, defaults: {format: 'json'}
    end
  end

end
