class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :cd_id
      t.string :disc_name

      t.timestamps
    end
  end
end
