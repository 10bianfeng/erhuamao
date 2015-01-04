class AddTravelIdToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :travel_id, :integer
  end
end
