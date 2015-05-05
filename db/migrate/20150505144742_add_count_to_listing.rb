class AddCountToListing < ActiveRecord::Migration
  def self.up
    add_column :listings, :count, :integer, :default => 0
  end

  def self.down
    remove_column :listings, :count
  end
end