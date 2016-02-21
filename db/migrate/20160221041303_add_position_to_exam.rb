class AddPositionToExam < ActiveRecord::Migration
  def change
    add_column :exams, :position, :integer
  end
end
