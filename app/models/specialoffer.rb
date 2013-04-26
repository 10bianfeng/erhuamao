class Specialoffer < ActiveRecord::Base
	has_many :specialoffer_travels
	has_many :travels, :through => :specialoffer_travels

	# 上传
	mount_uploader :cover, CoverUploader
	
	default_scope order('created_at ASC')
end
