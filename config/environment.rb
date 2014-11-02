# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.development?
  Rails.logger = Le.new('c90b5a6a-1843-4961-918c-45a14ae6f9b5', debug: true)
else
  Rails.logger = Le.new('c90b5a6a-1843-4961-918c-45a14ae6f9b5')
end
