# -*- encoding : utf-8 -*-
class Photo < ActiveRecord::Base
	mount_uploader :pic, PhotoUploader
	belongs_to :gallery
end
