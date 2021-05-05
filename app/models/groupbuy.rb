class Groupbuy < ApplicationRecord
    belongs_to :wishlist, optional: true
    belongs_to :category, optional: true

    validates :name, :start_date, :end_date, :pricing, presence: true
    validates :name, length: {minimum: 1}

    # Scope Methods
    scope :filter_by_status, -> (status) { where status: status }
    scope :filter_by_cat, -> (category_id) {where category_id: category_id}

    def self.search(search)
        if search
            where(["name LIKE ?", "%#{search}%"])
        else
            @groupbuys = Groupbuy.all
        end
    end
    
end
