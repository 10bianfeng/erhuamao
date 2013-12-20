# -*- encoding : utf-8 -*-
class Brochure < ActiveRecord::Base
	has_many :brochure_travels
	has_many :travels, :through => :brochure_travels

	mount_uploader :cover, CoverUploader
	mount_uploader :doc, DocUploader
end
