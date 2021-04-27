class User < ApplicationRecord
    has_many :wishlists
    has_many :groupbuys, through: :wishlists

    devise :database_authenticatable, :registerable,
         :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

    # Validations

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0, 20]
          user.name = auth.info.name
        end
      end
end