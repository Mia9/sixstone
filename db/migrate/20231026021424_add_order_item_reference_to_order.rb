class AddOrderItemReferenceToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :order_item, null: false, foreign_key: true
  end
end
