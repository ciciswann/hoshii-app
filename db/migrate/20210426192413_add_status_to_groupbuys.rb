class AddStatusToGroupbuys < ActiveRecord::Migration[6.1]
  def change
    add_column :groupbuys, :status, :string
  end
end
