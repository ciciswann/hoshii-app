class AddWishlistAndCategoryToGroupbuy < ActiveRecord::Migration[6.1]
  def change
    add_reference :groupbuys, :wishlist, foreign_key: {on_delete: :nullify}
    add_reference :groupbuys, :category, null: true, foreign_key: {on_delete: :nullify}
  end
end
