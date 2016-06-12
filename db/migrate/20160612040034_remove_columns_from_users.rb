class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :encrypted_password, :string
    remove_column :users, :salt, :string
  end
end
