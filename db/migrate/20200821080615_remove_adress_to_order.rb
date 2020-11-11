class RemoveAdressToOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :end_users, :street_adress, :string
    remove_column :orders, :street_adress, :string
    remove_column :orders, :adress_option, :integer
    add_column :orders, :address_option, :integer,default: 0, null: false, limit: 1
    add_column :end_users, :street_address, :string
    add_column :orders, :street_address, :string
    add_column :orders, :order_address_id, :integer
  end
end
