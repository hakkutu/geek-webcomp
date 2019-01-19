class AddTotalPriceToOrderlists < ActiveRecord::Migration[5.2]
  def change
    add_column :orderlists, :total_price, :integer
  end
end
