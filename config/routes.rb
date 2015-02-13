Rails.application.routes.draw do
  resources :organisations
  resources :questions
  resources :people
  resources :messages
  resources :responses, path: '/conversations'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'dashboard#index'
  get '/admin', to: 'admin#index', as: :admin
  devise_for :users
  mount_griddler

  # get '/dashboard',     to: 'dashboard#index', as: :dashboard
  # get '/conversations', to: 'responses#index', as: :conversations
  post '/query_happiness', to: 'mail_query#happiness', as: :query_happiness
end
