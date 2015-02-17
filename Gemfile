source 'https://rubygems.org'

ruby '2.2.0'

gem 'rails', '4.2.0'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'devise'
gem 'autoprefixer-rails'
gem 'haml'
gem 'haml-rails'
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass', branch: 'v1.0beta'
gem 'griddler'
gem 'griddler-mailgun', github: 'JobV/griddler-mailgun'
gem 'chartkick'
gem 'groupdate'
gem 'pg'
gem 'rails_admin'
gem 'responders', '~> 2.0'
gem 'pikaday-gem'
gem 'simple_form'

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
