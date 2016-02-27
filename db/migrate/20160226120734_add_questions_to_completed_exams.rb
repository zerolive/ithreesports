class AddQuestionsToCompletedExams < ActiveRecord::Migration
  def change
    add_column :completed_exams, :questions, :integer
  end
end
