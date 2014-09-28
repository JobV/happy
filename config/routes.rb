Rails.application.routes.draw do
  root to: 'responses#index'
  resource :responses
  get '/admin', to: 'admin#index', as: :admin
  devise_for :users
  mount_griddler
end
