class RenameContantToDescriptionInBlogs < ActiveRecord::Migration[8.1]
  def change
    rename_column :blogs, :contant, :description
    
  end
end
