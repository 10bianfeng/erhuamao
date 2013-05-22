class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :pages, :type, :page_type
  end

  def self.down
  	rename_column :pages, :page_type, :type_of_page
  end
end
