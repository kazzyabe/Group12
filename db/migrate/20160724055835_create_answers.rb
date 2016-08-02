class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :r1, :default => ""
      t.string :r2, :default => ""
      t.string :r3, :default => ""
      t.string :r4, :default => ""
      t.string :r5, :default => ""

      t.timestamps null: false
    end
  end
end
