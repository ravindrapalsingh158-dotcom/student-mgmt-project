class ChangeColoumnNameTodemos < ActiveRecord::Migration[8.1]
  def change
    rename_column :demos, :description, :text
  end
end
