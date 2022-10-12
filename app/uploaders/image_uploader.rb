class ImageUploader < CarrierWave::Uploader::Base
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/"
  end

  if Rails.env.development?
    # storage :file
    storage :fog

  # elsif Rails.env.test?
  #   storage :file
  # else
  #   storage :fog
  end
end
