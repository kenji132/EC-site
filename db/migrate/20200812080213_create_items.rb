class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :without_tax
      t.string :image_id
      t.boolean :is_sold,default: false

      t.timestamps
    end
  end
end
