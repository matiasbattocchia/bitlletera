# Problema Devise-Bootstrap. Aparentemente cuando un enlace
# que está en una barra de navegación usa el método :delete,
# se obtiene :get, por lo que hay que configurar Devise para
# que sign_out vaya con :get y no con :delete (lo usual).
# https://groups.google.com/forum/?fromgroups=#!topic/twitter-bootstrap-stackoverflow/Paz2NZqj7Is
# config/initializers/devise.rb:
# config.sign_out_via = :get


source 'https://rubygems.org'

gem 'rails', '3.2.7'
gem 'haml'
gem 'sass'
# bundle

gem 'haml-rails'
# app/views/layouts/application.html.haml

# Simple Navigation
gem 'simple-navigation'
# rails generate navigation_config
# config/navigation.rb

# Rails Translate Routes
gem 'rails-translate-routes'
# echo "ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml', { :no_prefixes => true })" >> config/routes.rb
# config/locales/routes.yml

# Rails i18n
gem 'rails-i18n'
# echo "config.i18n.default_locale = 'es-AR'" >> config/application.rb
# echo "config.i18n.available_locales = ['es-AR', 'es', 'en']" >> config/application.rb 
# echo "config.i18n.fallbacks = {'es-AR' => 'es'}" >> config/application.rb
#
# app/controllers/application_controller.rb:
#
# before_filter :set_locale
#    
# def set_locale
#   I18n.locale = params[:locale] || I18n.default_locale
# end

# i18n Country Translations
gem 'i18n-country-translations' # Usa 'es'.
# Usage: t(:US, :scope => :countries)

# Devise
gem 'devise'
gem 'devise-i18n' # Usa 'es'.
# rails generate devise:install
# rails generate devise User
# config/application.rb: mailer.
# config/routes.rb: root.

# CanCan
gem 'cancan'
# rails generate cancan:ability
# app/models/ability.rb

# Rolify
gem 'rolify'
# rails generate rolify:role

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# SQLite
gem 'sqlite3'

# Bitcoind JSON-API wrap
gem 'bitcoin-client'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  
  # Compass
  gem 'compass-rails'
  # bundle exec compass init --using blueprint
  # config/compass.rb
  # app/assets/stylesheets
  #
  # gem 'compass-susy-plugin' (No funcionó.)
  # gem 'compass_twitter_bootstrap' (Desactualizado y con fallos.)
  #   //=require bootstrap-all
  #   @import compass_twitter_bootstrap

  gem 'twitter-bootstrap-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  
  # Forgery — Generador de texto y datos.
  gem 'forgery'

  #capybara

  # Reemplazo de irb
  gem 'pry'
  gem 'pry-rails'
  gem 'hirb'

  # Pretty printed test output
  gem 'turn', :require => false
  gem 'minitest'
end

gem 'jquery-rails'
 
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
