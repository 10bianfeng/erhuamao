class Hotel < ActiveRecord::Base
	has_many :photos, :as => :resource
	has_many :itinerary
end
