# -*- encoding : utf-8 -*-
class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.string :title
      t.integer :travel_id

      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
