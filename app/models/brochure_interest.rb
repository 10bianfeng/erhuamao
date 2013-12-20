# -*- encoding : utf-8 -*-
class BrochureInterest < ActiveRecord::Base
	belongs_to :brochure
  belongs_to :interest
end
