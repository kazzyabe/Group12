class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :q1, :default => ""
      t.string :q2, :default => ""
      t.string :q3, :default => ""
      t.string :q4, :default => ""
      t.string :q5, :default => ""

      t.timestamps null: false
    end
  end
end
