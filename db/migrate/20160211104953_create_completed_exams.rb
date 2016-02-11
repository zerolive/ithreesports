class CreateCompletedExams < ActiveRecord::Migration
  def change
    create_table :completed_exams do |t|
      t.integer :user_id
      t.integer :answers
      t.integer :score

      t.timestamps null: false
    end
  end
end
