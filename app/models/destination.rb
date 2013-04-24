class Destination < ActiveRecord::Base
	has_ancestry
	has_many :destination_travels
	has_many :travels, :through => :destination_travels
	has_many :photos, :as => :resource
	default_scope order('created_at ASC')
end
