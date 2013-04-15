class DestinationTravel < ActiveRecord::Base
	validates_presence_of :destination_id
  validates_presence_of :travel_id
  validates_uniqueness_of :travel_id, :scope => :destination_id

	belongs_to :destination
  belongs_to :travel
end