class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uid, null: false                          # カード番号
      t.string :last_name, null: false                    # 姓
      t.string :first_name, null: false                   # 名
      t.string :klass, null: false                        # クラス
      t.integer :student_number, unique: true             # 学籍番号
      t.string :password_digest, null: false              # パスワード
      t.boolean :teacher, null: false, default: false     # 教師フラグ

      t.timestamps
    end
  end
end
