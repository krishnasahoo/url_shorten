# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShortLink, type: :model do
  before { ShortLink.create!(source_url: "http://example.com", key: "abcde") }

  it "is valid with valid attributes" do
    short_link = ShortLink.new(source_url: "http://google.com", key: "abc12")
    expect(short_link).to be_valid
  end

  it "is not valid without a source title" do
    short_link = ShortLink.new(source_url: nil)
    expect(short_link).to_not be_valid
  end

  it "is not valid without a key" do
    short_link = ShortLink.new(key: nil)
    expect(short_link).to_not be_valid
  end

  it "is not valid with duplicate key" do
    short_link_new = ShortLink.new(source_url: "http://google.com", key: "abcde")
    expect(short_link_new).to_not be_valid
  end
end
