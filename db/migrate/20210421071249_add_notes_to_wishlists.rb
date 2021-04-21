class AddNotesToWishlists < ActiveRecord::Migration[6.1]
  def change
    add_column :wishlists, :note, :text
  end
end
