class AddHomeToStudents < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :home, :string
  end
end
