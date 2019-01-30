class CreateCdFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :cd_favorites do |t|
      t.integer :user_id
      t.integer :cd_id
      t.integer :favorite

      t.timestamps
    end
  end
end
