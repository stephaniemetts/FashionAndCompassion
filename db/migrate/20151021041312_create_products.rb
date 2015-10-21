class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :sku
      t.string :color
      t.string :collection
      t.integer :warehouse_inventory
      t.integer :bdbox_inventory
      t.integer :blacklion_inventory
      t.integer :cotswold_inventory
      t.integer :cost_cents
      t.text :notes
      t.integer :wholesale_cents
      t.integer :retail_cents
      t.boolean :selling

      t.timestamps null: false
    end
  end
end
