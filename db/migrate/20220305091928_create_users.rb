class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name , null: false, unique: true
      t.string :email,              unique: true
      t.string :uid,                  null: false

      t.timestamps
    end
  end
end
