class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :start_date, null: false
      t.date :return_date, null: false
      t.boolean :is_return, null: false, default: false

      t.timestamps
    end
  end
end
