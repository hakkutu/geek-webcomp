class AddDiscMberToDiscs < ActiveRecord::Migration[5.2]
  def change
    add_column :discs, :disc_number, :integer
  end
end
