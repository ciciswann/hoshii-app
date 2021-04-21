class FixTypeColumn < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :groupbuys, :type, :item_type
  end
end
