# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                     root GET    /                              chat_rooms#index
#               chat_rooms GET    /chat_rooms(.:format)          chat_rooms#index
#                          POST   /chat_rooms(.:format)          chat_rooms#create
#            new_chat_room GET    /chat_rooms/new(.:format)      chat_rooms#new
#                chat_room GET    /chat_rooms/:id(.:format)      chat_rooms#show
#                chat_home GET    /chat_home(.:format)           chat_rooms#home
#                  welcome GET    /welcome(.:format)             welcome#index
#            welcome_intro GET    /welcome/intro(.:format)       welcome#intro
#                                 /cable                         #<ActionCable::Server::Base:0x007fd05b6eb918 @mutex=#<Monitor:0x007fd05b6eb8f0 @mon_owner=nil, @mon_count=0, @mon_mutex=#<Thread::Mutex:0x007fd05b6eb878>>, @pubsub=nil, @worker_pool=nil, @event_loop=nil, @remote_connections=nil>
#

Rails.application.routes.draw do
  devise_for :users
  root 'chat_rooms#index'
  resources :chat_rooms, only: [:new, :create, :show, :index]
  get 'chat_central', to: 'chat_rooms#home'

  get 'welcome', to: 'welcome#index'
  get 'welcome/intro', to: 'welcome#intro'

  mount ActionCable.server => '/cable'
end
