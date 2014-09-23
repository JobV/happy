Rails.application.routes.draw do
  devise_for :users
  get "/email_processor", to: proc { [200, {}, ["OK"]] }, as: "mandrill_head_test_request"
end
