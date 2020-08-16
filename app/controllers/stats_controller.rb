# frozen_string_literal: true

class StatsController < ApplicationController
  def index
    ## Using joining and group by clause we can get sum of clicks in a single query along with short_links data
    @short_links = ShortLink
      .select("short_links.id, short_links.source_url, short_links.key, sum(tracks.clicks) total_clicks")
      .joins("left outer join tracks on tracks.short_link_id = short_links.id")
      .where("short_links.expire_date >= DATE()")
      .group("short_links.id, short_links.source_url, short_links.key")
  end
end
