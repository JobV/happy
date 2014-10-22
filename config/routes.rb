Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :people

  root to: 'responses#index'
  resources :responses
  get '/admin', to: 'admin#index', as: :admin
  devise_for :users
  mount_griddler

  post '/query_happiness', to: 'mail_query#happiness', as: :query_happiness
end
