class Travel < ActiveRecord::Base
	has_many :itineraries
	has_many :datesprices

	has_many :destination_travels
	has_many :destinations, :through => :destination_travels

	has_many :interest_travels
	has_many :interests, :through => :interest_travels

	has_many :specialoffer_travels
	has_many :specialoffers, :through => :specialoffer_travels

	has_many :brochure_travels
	has_many :brochures, :through => :brochure_travels

	has_many :bookings

	# 上传
	mount_uploader :cover, CoverUploader

	# 默认排序
	default_scope order('created_at DESC')
end
