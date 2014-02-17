IMAGE_UPLOADER_ALLOW_IMAGE_VERSION_NAMES = %(50x50 140x140 500x500)
class BaseUploader < CarrierWave::Uploader::Base
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}"
  end
  
  def default_url
    "#{Setting.upyun_upload_url}/blank.png#{version_name}"
  end

  def url(version_name = "")
    @url ||= super({})
    version_name = version_name.to_s
    return @url if version_name.blank?
    if not version_name.in?(IMAGE_UPLOADER_ALLOW_IMAGE_VERSION_NAMES)
      raise "BaseUploader version_name:#{version_name} not allow."
    end
    [@url, version_name].join("!")
  end

  def ext
    file.extension.downcase
  end

  def filename
    if super.present?
      model.uploader_secure_token ||= SecureRandom.uuid.gsub("-", "")
      Rails.logger.debug("(BaseUploader.filename) #{model.uploader_secure_token}")
      "#{model.uploader_secure_token}.#{ext}"
    end
  end
end