if ENV["GOOGLE_STORAGE_ID"] && ENV["GOOGLE_STORAGE_SECRET"]
  CarrierWave.configure do |config|
    c.storage = :fog
    config.fog_provider = 'fog/google'                        # required
    config.fog_credentials = {
      provider:                         'Google',
      google_storage_access_key_id:     ENV["GOOGLE_STORAGE_ID"],
      google_storage_secret_access_key: ENV["GOOGLE_STORAGE_SECRET"]
    }
    config.fog_directory = 'pauline-et-damien'
  end
end
