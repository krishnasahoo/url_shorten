# frozen_string_literal: true

class HomeController < ApplicationController
  include HomeHelper
  def index
    @short_link = ShortLink.new
  end

  def track_clicks
    remote_ip = request.remote_ip
    sl = ShortLink.where(key: params[:key]).first
    if sl.present? && sl.expire_date >= Date.today
      ## bot requests are checked to avoid unnecessary keeping of clicks data from different bots
      if !bot_request?
        ## while checking in local system we need to check if the short url is hit from local system.
        ## So we must save the localurl and localcountry in credentials.yml.enc.
        ## Otherwise request.location.country will throw exception
        if request.remote_ip == Rails.application.credentials.localurl
          country_code = Rails.application.credentials.localcountry
        else
          country_code = request.location.country
        end

        ## First check if short url is hit from the same ip.
        ## If it is found we will just increase the clicks count.
        ## No need to create a new record
        trc = Track.where(referer: request.referer, ip_address: remote_ip, short_link_id: sl.id)
                .where(clicked_at: (Time.now.midnight - 1.day)..Time.now.midnight).first
        if trc.present?
          trc.update_attributes(clicks: trc.clicks + 1)
        else
          Track.create(referer: request.referer, ip_address: remote_ip, clicks: 1,
                clicked_at: Time.now, short_link_id: sl.id,
                user_agent: request.env["HTTP_USER_AGENT"], country_code: country_code)
        end
        ## Once track record is saved, now we can move to the source url
        redirect_to sl.source_url
      else
        flash.now[:notice] = "Invalid user agent"
      end
    else
      flash.now[:notice] = "Invalid Key"
    end
  end
end
