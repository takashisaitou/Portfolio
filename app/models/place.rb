class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  # has_many :gardens
end
