
CarrierWave.configure do |config|

  if Rails.env.test? or Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider => 'AWS', # required
      :aws_access_key_id => 'AKIAJLLX5CFHYZ7VGI3Q', # required
      :aws_secret_access_key => '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', # required
      :region => 'eu-west-1'
    }
    config.fog_directory = 'we-got-singles'
  end
end