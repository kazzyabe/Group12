class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.string :salt

      t.string :gender
      t.string :interestedin
      t.integer :age
      t.string :biography
      t.string :realname
      t.timestamps null: false
    end
  end
end
