class AddLastLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lastlocation, :string
  end
end
