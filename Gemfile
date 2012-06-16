source 'http://rubygems.org'

gem 'rails',  '3.1.3'
gem 'thin'
gem 'pg',           '0.11.0'
gem 'haml',         '3.1.4'
gem 'simple_form',  '2.0.1'
gem 'devise',       '1.5.3'
gem 'cancan',       '1.6.7'
gem 'json_builder', '3.0.6'
gem 'ember-rails',  '0.2.4'
gem 'twitter-bootstrap-rails', :git => 'http://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'compass',      :git => "git://github.com/chriseppstein/compass.git", :branch => "master", :ref => 'be7b41947963f2df98a7cddf918a1a912cacf182'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'google-api-client',  '~> 0.4.2'
gem 'httpadapter',        '~> 1.0.1'

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
  gem 'capybara',         :git => 'git://github.com/jnicklas/capybara.git', :ref => 'ec94dd9d498b67ed5919'
  gem 'selenium-webdriver', '2.8.0' #REMOVE THIS LINE WHEN 2.12> is released and this bug is fixed : http://code.google.com/p/selenium/issues/detail?id=2700
  gem 'rspec',            '2.6.0'
  gem 'rspec-rails',      '2.6.1'
  gem 'shoulda-matchers', '1.0.0'
  gem 'machinist',        '1.0.6'
end
