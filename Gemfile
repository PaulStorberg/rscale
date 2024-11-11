source 'https://rubygems.org'
ruby '3.1.4'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 6.1.7'

gem 'aws-sdk-s3'
gem 'bootsnap', '>= 1.7.0', require: false
gem 'bootstrap', '~> 4.3.1'
gem 'chartkick'
gem 'cocoon'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '>= 4.7.1'
gem 'devise_invitable', '~> 2.0.5'
gem 'font-awesome-rails'
gem 'friendly_id', '~> 5.2.4'
gem 'groupdate'
gem 'image_processing', '~> 1.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '>= 1.2'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'redis', '~> 4.0'
gem 'sassc-rails', '~> 2.1'
gem 'select2-rails'
gem 'sidekiq'
gem 'rolify', '~> 5.3'
gem 'terser', '>= 1.0.0'
gem 'turbolinks', '~> 5'
gem 'webrick', '~> 1.7'
gem 'ffi', '~> 1.15.5'
gem 'pry-rails'
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 3.35'
  gem 'selenium-webdriver'
  gem 'webdrivers', '~> 5.0'
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :production do
  gem 'rack-timeout'
  gem 'connection_pool'  # For better Redis connection handling
  gem 'barnes'          # For better Heroku metrics
end
