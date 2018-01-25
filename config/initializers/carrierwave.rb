# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Note: Environment Variables are setup in config/application.yml

# Amazon S3 stores data as objects within resources called "buckets."
# You can write, read, and delete objects in your bucket.
CarrierWave.configure do |config|
  config.root = Rails.root.join("public").to_s
  config.cache_dir = Rails.root.join("tmp", "uploads").to_s
  config.storage = :file
end
