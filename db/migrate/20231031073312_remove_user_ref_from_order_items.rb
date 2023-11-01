class RemoveUserRefFromOrderItems < ActiveRecord::Migration[7.0]
  def change
    remove_reference :order_items, :user, null: false, foreign_key: true
  end
end
