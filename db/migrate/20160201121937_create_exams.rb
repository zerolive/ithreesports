class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :title
      t.string :level
      t.string :video
      t.text :comment

      t.timestamps null: false
    end
  end
end
