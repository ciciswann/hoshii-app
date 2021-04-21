class WishlistsController < ApplicationController
    
    
    def index
        @user = User.find_by(id: params[:user_id])
        @user_wishlists = @user.wishlists
    end
end
