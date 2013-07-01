class Destination < ActiveRecord::Base
	has_ancestry
	has_many :destination_travels
	has_many :travels, :through => :destination_travels

	has_many :brochure_destinations
	has_many :brochures, :through => :brochure_destinations
	has_many :cities
	
	belongs_to :gallery


	default_scope order('created_at ASC')
end
