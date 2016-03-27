class RemovePriceFromCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :price, :integer
  end
end
