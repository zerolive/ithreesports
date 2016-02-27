class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :title
      t.boolean :right

      t.timestamps null: false
    end
  end
end
