class RemoveColumnToStudents < ActiveRecord::Migration[8.1]
  def change
    remove_column :students, :address, :string
    remove_column :students, :adhar, :string
    remove_column :students, :home, :string
  end
end
