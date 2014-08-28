CarrierWave.configure do |config|
  config.storage = Rails.env.production? ? :fog : :file
  config.remove_previously_stored_files_after_update = true

  if Rails.env.production?
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                        # required
    :aws_secret_access_key  => ENV['AWS_ACCESS_SECRET_KEY'],                     # required
    :region                 => 'Tokyo'                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory = ENV['AWS_S3_BUCKET']
  config.fog_public = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}

  end
end
