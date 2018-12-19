class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
      t.integer :artist_id
      t.string :genre
      t.string :CdName
      t.string :jscketId

      t.timestamps
    end
  end
end
