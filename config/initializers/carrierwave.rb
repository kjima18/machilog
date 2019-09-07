CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  # config.storage =:fog
    config.fog_directory  = 'jimotalk-photo'

    config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_S3_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_S3_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }

end