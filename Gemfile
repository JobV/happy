source 'https://rubygems.org'

ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use sqlite3 as the database for Active Record

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc


gem 'devise'
gem 'autoprefixer-rails'
gem 'bootstrap-sass'
gem 'simple_form'
gem 'haml'
gem 'griddler'
gem 'griddler-mandrill'

group :production do
  gem 'rails_12factor'
  gem 'pg'
end

group :development do
  gem 'spring'
  gem 'guard'
  gem 'guard-rspec',    require: false
  gem 'guard-shell',    require: false
  gem 'rails_best_practices'
  gem 'foreman'
  gem 'quiet_assets'
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
