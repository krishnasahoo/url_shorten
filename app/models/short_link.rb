class ShortLink < ApplicationRecord
  before_create :set_expire_date
  validates :key, uniqueness: true, presence: true
  validates :source_url, presence: true
  validates  :source_url, url: true
  def short_url
    return Rails.application.credentials.base_url + "/" + key
  end
  private
  def set_expire_date
    self.expire_date =  Date.today + (Rails.application.credentials.url_expiry_date).to_i.days
  end
  def valid_url?(uri)
      begin
        uri = URI.parse(uri) && !uri.host.nil?
        return true
      rescue => ex
        false
      end
    end
end
