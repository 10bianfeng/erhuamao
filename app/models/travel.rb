class Travel < ActiveRecord::Base
	has_many :itineraries

	has_many :destination_travels
	has_many :destinations, :through => :destination_travels

	has_many :interest_travels
	has_many :interests, :through => :interest_travels

	default_scope order('created_at DESC')
end
