class ShortLink < ApplicationRecord
  before_create :set_expire_date
  validates :key, uniqueness: true, presence: true
  validates :source_url, presence: true
  validates  :source_url, url: true
  has_many :tracks
  attr_accessor :total_clicks
  def short_url
    return Rails.application.credentials.base_url + "/" + key
  end
  def top_countries
    begin
      countries = self.tracks
        .select("distinct tracks.country_code")
        .where("country_code is not null")
        .all.map{|cnt|  ISO3166::Country[cnt.country_code].name }
        if(countries.present?)
          return countries.join(",")
        else
          return ""
        end
    rescue 
    end
  end
  private
  def set_expire_date
    self.expire_date =  Date.today + (Rails.application.credentials.url_expiry_date).to_i.days
  end
end
