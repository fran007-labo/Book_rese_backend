require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  case Rails.env
  when 'development', 'test'
    config.storage = :file
    config.cache_storage = :file
  when 'production'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY_ID'], # アクセスキー
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'], # シークレットアクセスキー
      region: 'ap-northeast-1',
    }
    config.fog_provider = 'fog/aws'
    config.storage :fog
    config.cache_storage = :fog
    config.asset_host = "https://s3.ap-northeast-1.amazonaws.com/book-rese-images"
    config.fog_directory  = 'book-rese-images'
    config.fog_public = false
  end
end