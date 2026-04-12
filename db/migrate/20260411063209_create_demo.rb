class CreateDemo < ActiveRecord::Migration[8.1]
  def change
    create_table :demos do |t|
      t.timestamps
      t.string :name
      t.string :description
    end
  end
end
