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

	has_many :bookings, :dependent => :destroy
	has_many :questions
	has_many :dianpins

	belongs_to :gallery

	# 上传
	mount_uploader :cover, CoverUploader
	mount_uploader :desc_mappic, CoverUploader
	mount_uploader :itinerary_pic, CoverUploader
	mount_uploader :itinerary_bigpic, CoverUploader

	# 默认排序
	default_scope order('created_at DESC')
end
