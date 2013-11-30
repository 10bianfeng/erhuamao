class Page < ActiveRecord::Base
  belongs_to :travel, :polymorphic => true
end
