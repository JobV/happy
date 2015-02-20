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

  get '/settings', to: 'mail_query#settings', as: :settings
  get '/subscription', to: 'dashboard#subscription', as: :subscription
  # get '/dashboard',     to: 'dashboard#index', as: :dashboard
  # get '/conversations', to: 'responses#index', as: :conversations
  post '/people/:id/generate_response',
    to: 'people#generate_response',
    as: :generate_response

  post '/query_happiness', to: 'mail_query#happiness', as: :query_happiness
end
