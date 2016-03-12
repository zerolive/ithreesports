class AddNameToMediaFile < ActiveRecord::Migration
  def change
    add_column :media_files, :name, :string
  end
end
