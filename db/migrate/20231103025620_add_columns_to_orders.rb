class AddColumnsToOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :total_price, precision: 10, scale: 2
    add_column :orders, :name, :string
    add_column :orders, :phone, :string
    add_column :orders, :email, :string
    add_column :orders, :address, :string
    add_column :orders, :town, :string
    add_column :orders, :postcode, :string
    add_column :orders, :subtotal, :decimal, precision: 10, scale: 2
    add_column :orders, :shipping_cost, :decimal, precision: 10, scale: 2
    add_column :orders, :total, :decimal, precision: 10, scale: 2
    add_column :orders, :paid, :boolean, default: false
    add_column :orders, :status, :integer


  end
end
