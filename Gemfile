source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'devise'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'mongrel', '>= 1.2.0.pre2'
  gem 'mailcatcher'
  gem 'capistrano'
  gem 'rvm-capistrano'
end

gem 'jquery-rails'

group :development, :test, :cucumber  do
  gem 'rspec-rails', "~> 2.0"
  gem 'factory_girl_rails'
end

group :test, :cucumber do
  gem 'database_cleaner', :require => false
end

group :test do
  gem 'email_spec'
end

group :cucumber do
  gem 'cucumber-rails', :require => false
  gem 'capybara', :require => false
  gem 'xpath', :require => false
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
