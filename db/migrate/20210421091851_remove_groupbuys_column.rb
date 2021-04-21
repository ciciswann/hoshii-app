class RemoveGroupbuysColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :groupbuys, :item_type
  end
end
