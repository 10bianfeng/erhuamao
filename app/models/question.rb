# -*- encoding : utf-8 -*-
class Question < ActiveRecord::Base
	belongs_to :user
	belongs_to :travel
end
