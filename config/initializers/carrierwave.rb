CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider:              'AWS',
    region:                'ap-northeast-1',
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }
  config.fog_directory  = ENV['S3_BUCKET_NAME']
  config.asset_host     = "https://#{ENV['S3_BUCKET_NAME']}.s3.ap-northeast-1.amazonaws.com"
  config.cache_storage  = :fog
end
