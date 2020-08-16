# frozen_string_literal: true

require "rails_helper"

RSpec.describe HomeController do
  let(:short_link) { create(:short_link, source_url: "http://google.com", key: "abcde") }
  describe "get" do
    it "get short url form" do
      get :index
      expect(response.code).to eq "200"
    end
  end
  describe "track link" do
    it "saves tracks and redirect" do
      before_count = short_link.tracks.sum(:clicks)
      get :track_clicks, params: { key: short_link.key }
      expect(:short_link).to redirect_to(short_link.source_url)
      after_count = short_link.tracks.sum(:clicks)
      expect(after_count).not_to eq(before_count)
    end
  end
end
