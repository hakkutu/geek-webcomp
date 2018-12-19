class CreateArtistComments < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_comments do |t|
      t.integer :cd_id
      t.integer :artist_id
      t.text :body

      t.timestamps
    end
  end
end
