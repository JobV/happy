Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :people

  root to: 'dashboard#index'
  resources :responses
  get '/admin', to: 'admin#index', as: :admin
  devise_for :users
  mount_griddler

  get '/dashboard',     to: 'dashboard#index', as: :dashboard
  get '/conversations', to: 'responses#index', as: :conversations
  post '/query_happiness', to: 'mail_query#happiness', as: :query_happiness
end
