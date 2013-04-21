class Hotel < ActiveRecord::Base
	has_many :photos, :as => :resource
end
