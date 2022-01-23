# frozen_string_literal: true

require_relative "boot"

require "rails/all"
require "csv"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MagensinusCloud
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # Set the time zone
    config.time_zone = "Lisbon"

    # Postmark configuration file
    config.action_mailer.delivery_method = :postmark
    config.action_mailer.postmark_settings = { api_token: ENV["POSTMARK_TOKEN"] }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom template engine
    config.generators do |generator|
      generator.template_engine :haml
      generator.helper false
      generator.assets false
      generator.stylesheets false
      generator.javascripts false
      generator.test_framework nil
    end
  end
end
