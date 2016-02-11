class AddExamIdToCompletedExam < ActiveRecord::Migration
  def change
    add_column :completed_exams, :exam_id, :integer
  end
end
