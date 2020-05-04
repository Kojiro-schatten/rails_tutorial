class AddActivationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :activation_digest, :string
    #  アカウント有効化用の属性とインデックスを追加するマイグレーション
    add_column :users, :activated, :boolean, default: false
    add_column :users, :activated_at, :datetime
  end
end
