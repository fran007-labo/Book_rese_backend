class CreateBookImages < ActiveRecord::Migration[6.0]
  def change
    create_table :book_images do |t|
      t.references :book, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
