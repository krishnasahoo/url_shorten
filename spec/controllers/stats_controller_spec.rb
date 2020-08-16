# frozen_string_literal: true

require "rails_helper"

RSpec.describe StatsController do
  describe "get" do
    it "get statistics" do
      get :index
      expect(response.code).to eq "200"
    end
  end
end
