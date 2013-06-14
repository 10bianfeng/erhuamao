class City < ActiveRecord::Base
	has_many :hotels
	belongs_to :destination
end
