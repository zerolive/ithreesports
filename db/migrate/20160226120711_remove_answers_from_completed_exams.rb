class RemoveAnswersFromCompletedExams < ActiveRecord::Migration
  def change
    remove_column :completed_exams, :answers, :integer
  end
end
