class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    # デフォルトでは管理者になれないということを示す default: false
    add_column :users, :admin, :boolean, default: false
  end
end
