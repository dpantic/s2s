source 'https://rubygems.org'

gem 'rails', '3.2.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
end

group :production do
   gem 'pg'
 # Use unicorn as the app server
   gem 'unicorn'
end

# Gem for Google Analyticsp
group :production do
  gem 'rack-google-analytics', :require => "rack/google-analytics"
end

# Meta tags
gem 'metamagic'
gem 'twitter-bootstrap-rails', '~> 2.0.5'
gem 'bootstrap-sass', '2.0.0'
gem 'bcrypt-ruby', '3.0.1'
gem 'annotate', '2.5.0', group: :development

gem 'database_cleaner', '0.7.0'

gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'


group :test do
  
end
# gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
# Kontakte 
# gem 'contact_us', '~> 0.4.0.beta'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  #gem 'twitter-bootstrap-rails'
 
  gem 'uglifier', '>= 1.0.3'
end
#gem 'simple_form'
gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
