# -*- encoding : utf-8 -*-
class Shouye < ActiveRecord::Base
	mount_uploader :logo, CoverUploader
	mount_uploader :block_2_pic_1, CoverUploader
	mount_uploader :block_2_pic_2, CoverUploader
	mount_uploader :block_3_pic, CoverUploader
	mount_uploader :block_4_1_pic, CoverUploader
	mount_uploader :block_4_2_pic, CoverUploader
	mount_uploader :block_4_3_pic, CoverUploader
end
