class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image_path
      t.string :size
      t.string :room
      t.string :color
      t.integer :price
      t.string :material
      t.string :construction
      t.string :style

      t.timestamps
    end
  end
end
