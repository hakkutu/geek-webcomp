class CreateOrderlistCds < ActiveRecord::Migration[5.2]
  def change
    create_table :orderlist_cds do |t|
      t.integer :orderlist_id
      t.integer :cd_id
      t.integer :number
      t.integer :price

      t.timestamps
    end
  end
end
