class Groupbuy < ApplicationRecord
    belongs_to :wishlist
    belongs_to :category

    validates :name, :start_date, :end_date, :pricing, :image, presence: true
    validates :image, :name, uniqueness: true
    validates :name, length: {minimum: 2}

    # Scope Methods
end
