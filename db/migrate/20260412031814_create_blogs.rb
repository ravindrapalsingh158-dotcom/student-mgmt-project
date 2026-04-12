class CreateBlogs < ActiveRecord::Migration[8.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :contant
      t.integer :student_id

      t.timestamps
    end
  end
end
