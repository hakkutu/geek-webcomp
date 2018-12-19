class CreateCartCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_cds do |t|
      t.integer :cd_id
      t.integer :cart_id
      t.integer :number

      t.timestamps
    end
  end
end
