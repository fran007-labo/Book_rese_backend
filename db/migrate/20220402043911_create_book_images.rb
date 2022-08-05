class CreateBookImages < ActiveRecord::Migration[6.0]
  def change
    create_table :book_images do |t|
      t.integer :book_id, null: false
      t.integer :image_id, null: false 

      t.timestamps
    end
  end
end
