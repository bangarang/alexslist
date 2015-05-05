class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :status, default: 0
      t.datetime :expiry_date
      t.belongs_to :user, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
