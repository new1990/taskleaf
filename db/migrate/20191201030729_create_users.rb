class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # いずれの属性の値がnullにならないようにする=必ず何かしらの文字列が入る
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
      # 同じメールアドレスを持つユーザーが複数人存在しないようにunique: true
      t.index :email, unique: true
    end
  end
end
