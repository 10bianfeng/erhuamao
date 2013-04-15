class Interest < ActiveRecord::Base
	has_ancestry
	has_many :interest_travels
	has_many :travels, :through => :interest_travels
	default_scope order('created_at ASC')
end
