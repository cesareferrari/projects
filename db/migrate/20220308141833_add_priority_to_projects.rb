class AddPriorityToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :priority, :integer, default: 5
  end
end
