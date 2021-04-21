class AddWishlistAndCategoryToGroupbuy < ActiveRecord::Migration[6.1]
  def change
    add_reference :groupbuys, :wishlist, null: true, foreign_key: true
    add_reference :groupbuys, :category, null: true, foreign_key: true
  end
end
