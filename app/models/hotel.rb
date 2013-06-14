class Hotel < ActiveRecord::Base
	belongs_to :gallery
	belongs_to :destination
	belongs_to :city
	has_many :itinerary
end
