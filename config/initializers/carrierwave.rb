# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Note: Environment Variables are setup in config/application.yml

# Amazon S3 stores data as objects within resources called "buckets."
# You can write, read, and delete objects in your bucket.
CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: ENV["STORAGE_PROVIDER"],
    aws_access_key_id: ENV["STORAGE_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["STORAGE_SECRET_ACCESS_KEY"],
    region: ENV["STORAGE_REGION"],
    endpoint: ENV["STORAGE_ENDPOINT"]
  }
  config.root = Rails.root.join("public").to_s
  config.cache_dir = Rails.root.join("tmp", "uploads").to_s
  config.fog_attributes = { "Cache-Control" => "public, max-age=#{90.days.to_i}" }
  config.fog_directory = ENV["STORAGE_BUCKET"]
  config.fog_public = true
  config.storage = :fog
end
