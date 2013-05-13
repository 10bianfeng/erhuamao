class Hotel < ActiveRecord::Base
	belongs_to :gallery
	has_many :itinerary
end
