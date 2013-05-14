class Datesprice < ActiveRecord::Base
	belongs_to :travel
	has_many :bookings

	scope :by_year, lambda {|year| where("start_date >= ? and start_date <= ?", "#{year}-01-01", "#{year}-12-31")}
end
