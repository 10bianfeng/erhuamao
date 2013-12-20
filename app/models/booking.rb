# -*- encoding : utf-8 -*-
class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :travel
	belongs_to :datesprice

end
