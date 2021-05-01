class WishlistsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!, only: [:index, :new, :create]
    
    def index
        @user = User.find_by(params[:id])
        @user_wishlists = @user.wishlists
    end

    def new
        @user = User.find_by(params[:id])
        @wishlist = Wishlist.new    
    end

    def create
        @user = User.find_by(params[:id])
        @wishlist = Wishlist.new(wishlist_params)
        @wishlist.user = @user
        if @wishlist.save
          redirect_to user_wishlists_path(current_user), notice: "Wishlist created successfully."
        else
          render :new
        end
    end

    def show
        @user = current_user
        @wishlist = Wishlist.find_by(id: params[:id])
        render :show
    end

    def edit
        @wishlist = Wishlist.find_by(id: params[:id])
        @user = User.find_by_id(@wishlist.user_id)
    end


  def update
    @wishlist = Wishlist.find_by(id: params[:id])
    @user = User.find_by_id(@wishlist.user_id)
    if @wishlist.update(wishlist_params)
      redirect_to user_wishlists_path(current_user), notice: "Wishlist updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @wishlist = Wishlist.find_by(id: params[:id])
    @user = User.find_by_id(@wishlist.user_id)
    @wishlist.destroy
    respond_to do |format|
      format.html { redirect_to user_wishlists_path(current_user), notice: 'Wishlist was removed.' }
    end
  end

  def toggle_groupbuy
    @wishlist = Wishlist.find_by_id(params[:wishlist_id])
    @wishlist.toggle_groupbuy(Groupbuy.find_by_id(params[:groupbuy_id]))
    redirect_to groupbuys_path(:wishlist_id => @wishlist.id)
  end
  
  private

  def wishlist_params
    params.require(:wishlist).permit(:name, :note)
  end
end
