class Travel < ActiveRecord::Base
	has_many :itineraries
	belongs_to :destination
	default_scope order('created_at DESC')
end
