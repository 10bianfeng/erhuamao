class InterestTravel < ActiveRecord::Base
	validates_presence_of :interest_id
  validates_presence_of :travel_id
  validates_uniqueness_of :travel_id, :scope => :interest_id

	belongs_to :interest
  belongs_to :travel
end
