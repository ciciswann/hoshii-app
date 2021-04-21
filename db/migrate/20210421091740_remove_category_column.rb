class RemoveCategoryColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :link
  end
end
