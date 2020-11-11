class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :street_adress
      t.string :name
      t.string :postcode
      t.integer :payment_method,default: 0, null: false, limit: 1
      t.integer :adress_option,default: 0, null: false, limit: 1
      t.integer :postage
      t.integer :billing_amount
      t.integer :order_status,default: 0, null: false, limit: 1

      t.timestamps
    end
  end
end
