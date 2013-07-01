class Page < ActiveRecord::Base

  def to_param
    name 
  end

  def to_query
    name    
  end
end
