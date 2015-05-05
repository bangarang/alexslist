class RemoveStatusFromListing < ActiveRecord::Migration
  def change
  	remove_column :listings, :status
  end
end
