class AddAddressToStudents < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :address, :string
    add_column :students, :adhar, :string
   
  end
end
