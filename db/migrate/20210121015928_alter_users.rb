class AlterUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :teacher
    add_column :users, :role, :integer, null: false, default: 1 #教師(1:生徒,2:教師)
  end
end
