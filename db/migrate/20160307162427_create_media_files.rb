class CreateMediaFiles < ActiveRecord::Migration
  def change
    create_table :media_files do |t|
      t.integer :course_id
      t.string :url
      t.string :video

      t.timestamps null: false
    end
  end
end
