class Gallery < ActiveRecord::Base
	has_many :photos

	has_many :hotels
	has_many :destinations
end
