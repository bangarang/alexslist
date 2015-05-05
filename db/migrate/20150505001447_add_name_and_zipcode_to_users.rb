class AddNameAndZipcodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :zipcode, :string
  end
end
