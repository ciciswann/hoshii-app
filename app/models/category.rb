class Category < ApplicationRecord
    has_many :groupbuys
    has_many :wishlists, through: :groupbuys

    accepts_nested_attributes_for :groupbuys

    validates :name, presence: true, length: {minimum: 3}

    def groupbuy_attributes=(groupbuys)
        #binding.pry
        groupbuys.values.each do |gb_hash|
            self.groupbuys.push(Groupbuy.create(gb_hash))
        end
    end
end
