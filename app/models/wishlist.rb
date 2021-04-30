class Wishlist < ApplicationRecord
    belongs_to :user
    has_many :groupbuys
    has_many :categories, through: :groupbuys

    validates :name, presence: true,
            length: {maximum: 50,
             too_long: "50 characters is the maximum allowed"}
    validates :note, length: {maximum: 400,
              too_long: "400 characters is the maximum allowed"},
            allow_blank: true

    def has_groupbuy?(groupbuy)
      groupbuy.wishlist_id == self.id
    end
    
    def toggle_groupbuy(groupbuy)
      if has_groupbuy?(groupbuy)
        self.groupbuys.delete(groupbuy)
      else
        self.groupbuys.push(groupbuy)
      end
    end

end
