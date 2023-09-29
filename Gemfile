source 'https://rubygems.org'

ruby '2.6.6'
gem 'rails', '4.2.11'


gem 'sass-rails', '~> 5.0.3'
gem 'uglifier', '>= 2.7.1'

gem 'jquery-rails'

gem 'execjs'
# gem 'therubyracer', :platforms => :ruby

# The movie db
gem 'themoviedb'

gem "omniauth"
gem "omniauth-rails_csrf_protection"
gem "omniauth-twitter2"


group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do

  gem 'byebug'
  gem 'database_cleaner'
  gem 'cucumber-rails', require: false
  gem 'rspec-rails'

  gem 'pry'
  gem 'pry-byebug'
  gem 'capybara'
  gem 'launchy'


  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.6'
end

group :production do
  gem 'pg', '~> 0.2'
  gem 'rails_12factor'
end
