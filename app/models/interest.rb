class Interest < ActiveRecord::Base
	has_ancestry
	
	has_many :interest_travels
	has_many :travels, :through => :interest_travels

	has_many :brochure_interests
	has_many :brochures, :through => :brochure_interests

	# 上传
	mount_uploader :cover, CoverUploader
	
	default_scope order('created_at ASC')
end
