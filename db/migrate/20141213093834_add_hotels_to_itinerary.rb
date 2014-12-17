class AddHotelsToItinerary < ActiveRecord::Migration
  def self.up
    add_column :itineraries, :hotel_id2, :integer
    add_column :itineraries, :hotel_id3, :integer
    add_column :itineraries, :hotel_id4, :integer
    add_column :itineraries, :hotel_id5, :integer
  end
end
