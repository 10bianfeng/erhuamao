# -*- encoding : utf-8 -*-
class SpecialofferTravel < ActiveRecord::Base
	validates_presence_of :specialoffer_id
  validates_presence_of :travel_id
  validates_uniqueness_of :travel_id, :scope => :specialoffer_id

	belongs_to :specialoffer
  belongs_to :travel
end
