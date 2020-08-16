# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShortLinksController do
  describe "create short link" do
    it "creates short link" do
      before_count = ShortLink.count
      short_link_params = { short_link: { source_url: "http://google.com" } }
      post :create, params: short_link_params, format: "js"
      expect(response.code).to eq "200"
      after_count = ShortLink.count
      expect(after_count).not_to eq(before_count)
    end
  end
end
