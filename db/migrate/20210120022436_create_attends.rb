class CreateAttends < ActiveRecord::Migration[6.0]
  def change
    create_table :attends do |t|
      t.datetime :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
