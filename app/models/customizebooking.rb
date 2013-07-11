class Customizebooking < ActiveRecord::Base
	belongs_to :gbooking
	belongs_to :destination
	belongs_to :city
	belongs_to :hotel
end
