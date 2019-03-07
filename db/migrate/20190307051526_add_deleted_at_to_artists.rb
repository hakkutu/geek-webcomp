class AddDeletedAtToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :deleted_at, :datetime
    add_index :artists, :deleted_at
  end
end
