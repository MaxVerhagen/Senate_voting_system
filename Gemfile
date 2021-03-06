source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: [:development, :test]
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Use bootstrap framework for css
gem 'bootstrap', '~> 4.3.1'

#################################
####### APP SPECIFIC GEMS #######
#################################

group :production do
  gem 'pg'  # for Heroku deployment
  gem 'rails_12factor'
end

# cucumber and Rspec
group :development, :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions - almost RSpec 3 compatible
  gem 'database_cleaner'               # to clear Cucumber's test database between runs
  gem 'capybara', '2.18.0'             # to avoid deprecation warnings
  gem 'cucumber', '2.99.0'             # to avoid bug in cucumber 3
  gem 'launchy'                        # a useful debugging aid for user stories
  gem 'webdrivers', '~> 3.0'
  gem 'factory_bot_rails'

  # Unit testing framework
  gem 'autotest'
  gem 'rspec-rails'
  gem 'rails-controller-testing'

  # Allows to build test ActiveRecord models for each test
  gem 'with_model'

  # Code coverage for Ruby
  gem 'simplecov', require: false
end

group :development do
  # Run Rspec when files have changed
  gem 'guard-rspec', require: false
  # Run Cucumber when files have changed
  gem 'guard-cucumber', require: false
  # This gem implements the rspec command for Spring
  gem 'spring-commands-rspec'
  # Automatically bundle when the Gemfile has been changed 
  gem 'guard-bundler', require: false
  # Static analysis 
  gem 'rubocop', require: false
end

# Html templating markup language
gem 'haml-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Enables use of sortable lists using jquery ui
gem 'jquery-ui-rails'
gem 'rails_sortable'

# To display beautiful charts
gem "chartkick"

# Allows for safe use of and and
gem 'andand'

# Enables pretty console (ap)
gem 'awesome_print', require:'ap'
