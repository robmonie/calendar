source 'http://rubygems.org'

gem 'rails',  '3.2.11'
gem 'thin'
gem 'pg',           '0.14.1'
gem 'haml',         '3.1.4'
gem 'simple_form',  '2.0.1'
gem 'devise',       '1.5.3'
gem 'cancan',       '1.6.7'
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem "active_model_serializers", '0.7.0'
gem 'strong_parameters'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'


# Gems used only for assets and not required
# in production environments by default.
group :assets do

end

gem 'compass-rails', '1.0.3'
gem 'sass-rails',   '~> 3.2.5'
gem 'coffee-rails', '~> 3.2.2'
gem 'uglifier', '>= 1.0.3'

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'


# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :production do
  gem 'newrelic_rpm'
end

group :development, :test do
  # Pretty printed test output
  gem 'turn',             '0.8.2', :require => false
  gem 'database_cleaner', '0.7.0'
  gem 'capybara',         '2.0.2'
  gem 'rspec',            '2.13.0'
  gem 'rspec-rails',      '2.13.0'
  gem 'shoulda-matchers', '1.0.0'
  gem 'machinist',        '1.0.6'
  gem 'konacha'
end
