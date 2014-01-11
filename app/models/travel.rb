# -*- encoding : utf-8 -*-
class Travel < ActiveRecord::Base

  default_scope order("id desc, position desc")
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
	has_many :questions, :dependent => :destroy
	has_many :dianpins, :dependent => :destroy

	belongs_to :gallery

  has_many :travel_pages

	# 上传
	mount_uploader :cover, CoverUploader
	mount_uploader :desc_mappic, CoverUploader
	mount_uploader :itinerary_pic, CoverUploader
	mount_uploader :itinerary_bigpic, CoverUploader

	# 默认排序
	default_scope order('created_at DESC')

  def travel_type_icon
    case self.travel_type
    when condition
    end
  end

  def interest_icon
    iname = self.interests.first.title
    (["奢华小众游", "经典团队游", "私家订制游", "邮轮旅游", "非洲游猎", "求婚&蜜月", "心灵疗养", "亲子假期", "居游"].index(iname) || 0) + 1
  end
end
