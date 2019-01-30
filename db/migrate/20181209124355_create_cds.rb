class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
      t.integer :artist_id
      t.string :genre
      t.string :cd_name
      t.string :jacket_id
      t.integer :price
      t.string :label
      t.integer :status
      t.integer :stock

      t.timestamps
    end
  end
end
