# frozen_string_literal: true

class Track < ApplicationRecord
  belongs_to :short_link
  belongs_to :country, optional: true
end
