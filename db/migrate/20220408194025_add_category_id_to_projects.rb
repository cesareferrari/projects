class AddCategoryIdToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :category_id, :integer
  end
end
