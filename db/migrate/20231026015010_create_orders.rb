class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :total_price, precision: 10, scale: 2
      t.references :user, null: false, foreign_key: true
      # t.references :order_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
