class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id
      t.string :street_address
      t.string :postcode
      t.string :ship_name

      t.timestamps
    end
  end
end
