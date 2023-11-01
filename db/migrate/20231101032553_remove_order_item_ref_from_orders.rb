class RemoveOrderItemRefFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orders, :order_item, null: false, foreign_key: true
  end
end
