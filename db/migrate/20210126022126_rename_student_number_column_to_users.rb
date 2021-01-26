class RenameStudentNumberColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :student_number, :number
  end
end
