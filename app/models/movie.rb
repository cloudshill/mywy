require "open-uri"
class Movie < ActiveRecord::Base
  serialize :aka
  serialize :directors
  serialize :casts
  serialize :writers
  serialize :pubdates
  serialize :languages
  serialize :genres
  serialize :countries

  mount_uploader :cover, MovieCoverUploader

  attr_accessor :uploader_secure_token

  has_many :show_times
  has_many :comments, as: :commentable
  has_many :favorites, as: :favoriteable

  validates :title, presence: true

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
