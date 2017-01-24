class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  # belongs_to :garden
  has_many :gardens
end
