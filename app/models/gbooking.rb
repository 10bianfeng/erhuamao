class Gbooking < ActiveRecord::Base
	belongs_to :user
	has_many :customizebookings
end
