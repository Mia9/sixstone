class RemoveProductRefFromOrderItems < ActiveRecord::Migration[7.0]
  def change
    remove_reference :order_items, :product, null: false, foreign_key: true
  end
end
