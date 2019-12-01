class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    # ユーザーが管理者かどうかを表すフラグ
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
