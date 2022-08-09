class CreateCartBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_books do |t|
      t.references :cart, index: true, null: false, foreign_key: true
      t.references :book, index: true, null: false, foreign_key: true
      t.timestamps
    end
  end
end
