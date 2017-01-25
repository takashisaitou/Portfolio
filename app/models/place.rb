class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  validates :title, presence: true
  validates :description, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :herbname, presence: true
  validates :content, presence: true

end
