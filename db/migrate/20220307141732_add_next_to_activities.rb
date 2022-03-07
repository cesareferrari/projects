class AddNextToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :next, :boolean, default: false
  end
end
