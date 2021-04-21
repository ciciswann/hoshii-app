class Wishlist < ApplicationRecord
    belongs_to :user
    has_many :groupbuys
    has_many :categories, through: :groupbuys

    validates :name, presence: true,
            length: {maximum: 80,
             too_long: "80 characters is the maximum allowed"}
    validates :notes, length: {maximum: 500,
              too_long: "500 characters is the maximum allowed"},
            allow_blank: true
end
