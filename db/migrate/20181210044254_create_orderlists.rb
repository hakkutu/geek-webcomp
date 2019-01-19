class CreateOrderlists < ActiveRecord::Migration[5.2]
  def change
    create_table :orderlists do |t|
      t.string :address
      t.integer :address_number
      t.integer :status
      t.integer :user_id

      t.timestamps
    end
  end
end
