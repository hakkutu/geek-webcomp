class AddFlagToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :flag, :integer
  end
end
