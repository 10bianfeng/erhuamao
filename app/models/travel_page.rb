# -*- encoding : utf-8 -*-
class TravelPage < ActiveRecord::Base
  belongs_to :travel

  validates :name, :presence => true
  validates :url, :presence => true
  validates :category, :presence => true
end
