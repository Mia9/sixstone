class AddOrderableToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_items, :orderable, polymorphic: true, index: true
  end
end
