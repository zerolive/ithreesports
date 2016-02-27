class RemoveRightFromAnswer < ActiveRecord::Migration
  def change
    remove_column :answers, :right, :boolean
  end
end
