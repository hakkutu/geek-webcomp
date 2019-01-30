class AddAdressNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :adress_number, :integer
  end
end
