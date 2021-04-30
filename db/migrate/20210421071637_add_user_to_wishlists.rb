class AddUserToWishlists < ActiveRecord::Migration[6.1]
  def change
    add_reference :wishlists, :user, foreign_key: {on_delete: :cascade}
  end
end
