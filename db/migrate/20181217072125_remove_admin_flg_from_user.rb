class RemoveAdminFlgFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :admin_flg, :boolean
  end
end
