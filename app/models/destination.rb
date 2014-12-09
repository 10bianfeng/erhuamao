# -*- encoding : utf-8 -*-
class Destination < ActiveRecord::Base
	has_ancestry
	has_many :destination_travels
	has_many :travels, :through => :destination_travels

	has_many :brochure_destinations
	has_many :brochures, :through => :brochure_destinations
	has_many :cities
	has_many :customizebookings
	has_many :banners


	belongs_to :gallery

end
