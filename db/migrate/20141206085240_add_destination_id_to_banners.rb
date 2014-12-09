class AddDestinationIdToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :destination_id, :integer
  end
end


