# -*- encoding : utf-8 -*-
module ApplicationHelper
	def admin?(user = nil)
    user ||= current_user
    user.try(:admin?)
  end
end
