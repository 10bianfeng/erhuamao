class Photocontest < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
end
