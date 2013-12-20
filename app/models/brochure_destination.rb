# -*- encoding : utf-8 -*-
class BrochureDestination < ActiveRecord::Base
	belongs_to :brochure
  belongs_to :destination
end
