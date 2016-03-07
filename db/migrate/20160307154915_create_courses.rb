class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :imageurl
      t.integer :price
      t.text :description
      t.string :videourl

      t.timestamps null: false
    end
  end
end
