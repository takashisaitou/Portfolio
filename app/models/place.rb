class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  belongs_to :garden
end
