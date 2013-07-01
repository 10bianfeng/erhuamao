class Gallery < ActiveRecord::Base
	has_many :photos

	has_many :hotels
	has_many :destinations
	has_many :cities
	has_many :travels
end
