# -*- encoding : utf-8 -*-
class Itinerary < ActiveRecord::Base
	belongs_to :travel
	default_scope order('sort ASC')
end
