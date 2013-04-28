class Itinerary < ActiveRecord::Base
	belongs_to :travel
	belongs_to :hotel
	default_scope order('sort ASC')
end