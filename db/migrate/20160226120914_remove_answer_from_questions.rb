class RemoveAnswerFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :answer, :boolean
  end
end
