# frozen_string_literal: true

class ShortLinksController < ApplicationController
  include ShortLinksHelper
  def create
    @short_link = ShortLink.new(short_link_params)
    @short_link.key = uniq_key
    unless @short_link.save
      @error = "Please give valid url"
    end
  end

private
  def short_link_params
    params.require(:short_link)
      .permit(
        :source_url
      )
  end
end
