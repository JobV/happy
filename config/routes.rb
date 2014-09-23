Rails.application.routes.draw do
  root to: 'responses#index'
  resource :responses
  devise_for :users
  mount_griddler
end
