class AddArtistIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :artist_id, :integer
  end
end
