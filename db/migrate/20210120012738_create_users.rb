class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uid, null: false                          # カード番号->uid
      t.string :last_name, null: false                    # 姓->last_name
      t.string :first_name, null: false                   # 名->first_name
      t.string :klass, null: false                        # クラス->klass
      t.integer :student_number, unique: true             # 学籍番号->number
      t.string :password_digest, null: false              # パスワード->password
      t.boolean :teacher, null: false, default: false     # 教師フラグ

      t.timestamps
    end
  end
end
