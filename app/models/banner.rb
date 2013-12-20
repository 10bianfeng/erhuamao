# -*- encoding : utf-8 -*-
class Banner < ActiveRecord::Base
	mount_uploader :cover, CoverUploader
end
