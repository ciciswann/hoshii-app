class GroupbuysController < ApplicationController
    before_action :authenticate_user!, only: [:index, :new, :create]

    ORDERS = [ "pricing ASC", "pricing DESC", "name ASC", "name DESC" ]

    def welcome
        @groupbuys = Groupbuy.all 
        render :welcome
    end
    
    def index
        @user = current_user
        @user_wishlists = @user.wishlists
        @wishlist = @user_wishlists.find_by(id: params[:wishlist_id])
        @groupbuys = Groupbuy.where(nil) # anonymous scope
        @groupbuys = @groupbuys.search(params[:search]) if params[:search].present?
        @groupbuys = @groupbuys.filter_by_status(params[:status]) if params[:status].present?
        @groupbuys = @groupbuys.filter_by_cat(params[:category_id]) if params[:category_id].present?
        if params[:ordering] && ordering = ORDERS[params[:ordering].to_i]
            @groupbuys = @groupbuys.order(ordering)
        end
        render :browse
    end

    def show
        @groupbuy = Groupbuy.find(params[:id])
        render :show
    end

    private

    def groupbuy_params
        params.require(:groupbuy).permit(:name, :price, :search)
    end

end
