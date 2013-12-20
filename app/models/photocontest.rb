# -*- encoding : utf-8 -*-
class Photocontest < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
end
