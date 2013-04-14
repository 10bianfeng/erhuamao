class Destination < ActiveRecord::Base
	#attr_accessible :parent
	has_ancestry
	has_many :travels
	default_scope order('created_at ASC')
end
