require "open-uri"
class Movie < ActiveRecord::Base
  mount_uploader :cover, MovieCoverUploader

  attr_accessor :uploader_secure_token

  has_many :show_times

  def self.download_file(url)
    img = nil
    begin
      img = MiniMagick::Image.read(open(url))
    rescue => e
      Rails.logger.error { "Movie.download_file ERROR: #{url} #{e}" }
    end
    return img
  end
end
