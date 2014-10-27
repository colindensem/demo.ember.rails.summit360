source 'https://rubygems.org'

ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
gem 'rails-api'
gem 'active_model_serializers'
gem 'unicorn'
# Use mysql as the database for Active Record
gem 'mysql2'
#Redis for the index serving. See Application / Landing Controller.
gem 'redis'
# Use SCSS for stylesheets

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',        group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'rb-readline'

group :development, :test do
  gem 'dotenv-rails' #https://github.com/bkeepers/dotenv
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-byebug'
  gem 'pry-rescue'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
group :development do
  gem 'spring'
  gem 'capistrano-rails'
  # gem 'capistrano-thin'
  gem 'capistrano3-unicorn'
  gem 'capistrano-rbenv', '~> 2.0', require: false
end

# Use debugger
# gem 'debugger', group: [:development, :test]

