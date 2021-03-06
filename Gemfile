source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Para encriptar los paswords de usuario
gem 'bcrypt-ruby', '3.0.1'	

group :development do
	# Use sqlite3 as the database for Active Record
	gem 'sqlite3', '1.3.7'
	gem 'rspec-rails', '2.13.1'
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
  gem 'aws-sdk'	# para subir archivos a AWS S3 desde la aplicación en heroku
end

group :test do
	gem 'selenium-webdriver', '2.35.1'
	gem 'capybara', '2.1.0'
end

# Use SCSS for stylesheets
gem 'sass-rails',   '4.0.0'
# gem 'compass-rails'
# gem 'modular-scale'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '4.0.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.1.1'


# SEO
gem 'friendly_id', '5.0.0.beta4' # Note: You MUST use 5.0.0 or greater for Rails 4.0+

# Gumby
# gem "modernizr-rails"
# gem 'gumby-framework'

# Bootstrap
# gem 'bootstrap-sass', '2.3.2.0'

# Foundation
gem 'zurb-foundation'

# Códigos QR (correos de confirmación de pedido): rqrcode y mini_magick
gem 'rqrcode-rails3'
gem 'mini_magick'

# Para incluir estilos CSS en los correos
gem 'roadie'

# Imágenes de productos con paperclip
# gem "paperclip", "~> 2.7"
gem 'paperclip', :git => "git://github.com/thoughtbot/paperclip.git"

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '2.2.1'
gem 'jquery-turbolinks'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '1.1.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '1.0.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '0.3.20', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
