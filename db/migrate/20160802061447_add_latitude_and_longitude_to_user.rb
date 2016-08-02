class AddLatitudeAndLongitudeToUser < ActiveRecord::Migration
  def change
    add_column :users, :latitude, :string
    add_column :users, :float, :string
    add_column :users, :longitude, :string
    add_column :users, :float, :string
  end
end
