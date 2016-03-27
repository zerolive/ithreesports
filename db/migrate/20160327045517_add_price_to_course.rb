class AddPriceToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :price, :float, :scale => 2
  end
end
