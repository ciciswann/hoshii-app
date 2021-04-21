class User < ApplicationRecord
    has_many :wishlists
    has_many :groupbuys, through: :wishlists

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

    def self.create_from_provider_data(provider_data)
        where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
            user.email = provider_data.info.email
            user.password = Devise.friendly_token[0, 20]
            user.name = provider_data.info.name
        end
    end
end