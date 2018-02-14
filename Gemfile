# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# See https://github.com/rails/execjs#readme for more supported runtimes
gem "therubyracer", platforms: :ruby

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.1.4"

# Use postgresql as the database for Active Record
gem "pg", "~> 0.21"

# Use Puma as the app server
gem "puma", "~> 3.11"

# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"

# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5.1"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"

# Use Uglifier as compressor for JavaScript assets
gem "uglifier", "~> 4.1"

# Enables Haml as the templating engine for you
gem "haml-rails", "~> 1.0"

# Upload files in your Ruby applications, map them to a range of ORMs, store them on different backends.
gem "carrierwave", "~> 1.2"

# Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick
gem "mini_magick", "~> 4.8"

# Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file
gem "figaro", "~> 1.1"

# The Ruby cloud services library
gem "fog", "~> 1.42"

# Drop-in plug-in for ActionMailer to send emails via Postmark
gem "postmark-rails", "~> 0.15.0"

# Use webpack to manage app-like JavaScript modules in Rails
# gem "webpacker", "~> 3.2", ">= 3.2.1"

# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", "~> 2.18"
  gem "selenium-webdriver", "~> 3.9"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "listen", "~> 3.1"
  gem "web-console", "~> 3.5"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"

  # Quiet Assets turns off Rails asset pipeline log
  # gem "quiet_assets", "~> 1.1"

  # Provides a better error page for Rails and other Rack apps
  gem "better_errors", "~> 2.4"

  # Retrieve the binding of a method's caller
  gem "binding_of_caller", "~> 0.8"

  # Kill N+1 queries and unused eager loading
  gem "bullet", "~> 5.7"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Linters
gem "coffeelint", require: false
gem "haml_lint", require: false
gem "reek", require: false
gem "rubocop", require: false
gem "scss_lint", require: false
