# -*- encoding : utf-8 -*-
class BrochureTravel < ActiveRecord::Base
	belongs_to :brochure
  belongs_to :travel
end
