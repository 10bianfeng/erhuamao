# -*- encoding : utf-8 -*-
class City < ActiveRecord::Base
	has_many :hotels
	belongs_to :destination
	belongs_to :gallery
	has_many :customizebookings
	
end
