class AddNameAndZipcodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, required: true
    add_column :users, :zipcode, :string, required: true
  end
end
