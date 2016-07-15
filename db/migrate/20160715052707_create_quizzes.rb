class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :q1
      t.string :q2
      t.string :q3
      t.string :q4
      t.string :q5

      t.timestamps null: false
    end
  end
end
