class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :category
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
