# frozen_string_literal: true

FactoryBot.define do
  factory :short_link do
    source_url { "https://stackoverflow.com/" }
    key { "asdfg" }
  end
end
