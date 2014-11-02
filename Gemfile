source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.2.0beta2'
gem 'sass-rails', '5.0.0.beta1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'devise'
gem 'autoprefixer-rails'
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'simple_form'
gem 'haml'
gem 'haml-rails'
gem 'griddler'
gem 'griddler-mandrill'
gem 'chartkick'
gem 'groupdate'
gem 'pg'
gem 'rails_admin'
gem 'le'

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'spring'
  gem 'guard'
  gem 'guard-rspec',    require: false
  gem 'guard-shell',    require: false
  gem 'rails_best_practices'
  gem 'foreman'
  gem 'quiet_assets'
  gem 'letter_opener'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-its'
  gem 'shoulda-matchers', require: false
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'sqlite3'
end
