source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'aws-sdk-s3', require: false
# Use Active Storage variant
gem 'image_processing', '~> 1.12', '>= 1.12.1'
# Use image processing like resize
gem 'mini_magick', '4.9.5'
# what is it?
gem 'active_storage_validations', '0.9.5'
# Use Active Model has_secure_password
gem 'bcrypt', '3.1.16'
# Use random dammy data like bot
gem 'faker', '2.1.2'
# Use pagination
gem 'will_paginate', '~> 3.3'
# Use comfortable css and sass
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass', '3.4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '1.4.5', require: false
# 
gem 'rexml', '3.2.5'
# Use font-awesome
gem 'font-awesome-rails'
# Use byebug
gem 'byebug'

# 環境をdockerにする際に追加
gem 'i18n', '1.12.0'
gem 'aws-partitions', '1.610.0'
gem 'pg', '~>1.2.3'
gem 'rake', '13.0.6'
gem 'public_suffix', '4.0.7'
gem 'nokogiri', '1.13.7'

# cronでバッチ処理を行う際に使用
gem 'whenever'

# group :development, :test do
#   # Use sqlite3 as the database for Active Record
#   gem 'sqlite3', '~> 1.4.2'
#   # Call 'byebug' anywhere in the code to stop execution and get a debugger console
#   # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
# end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  # gem 'rack-mini-profiler', '~> 2.0'
  # spring speeds up development by keeping your application running in the background.read more: https://github.com/rails/spring
  gem 'listen', '3.5.1'
  gem 'spring', '2.1.1'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'rubocop', '~> 1.29', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'rails-controller-testing','1.0.4'
  # default test framework of Rails
  gem 'minitest', '5.14.4'
  gem 'minitest-reporters', '1.3.8'
  # make test automatically
  gem 'guard', '2.16.2'
  gem 'guard-minitest', '2.4.6'
end

group :production do
  # gem 'pg', '~>1.2.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
