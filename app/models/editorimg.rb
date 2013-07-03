class Editorimg < ActiveRecord::Base
	mount_uploader :photo, CoverUploader
end
