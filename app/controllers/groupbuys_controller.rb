class GroupbuysController < ApplicationController
    before_action :authenticate_user!

    def welcome
        @groupbuys = Groupbuy.where(nil) # anonymous scope
        @groupbuys = @groupbuys.search(params[:search]) if params[:search].present?
        @groupbuys = @groupbuys.filter_by_status(params[:status]) if params[:status].present?
        @groupbuys = @groupbuys.sort_by_price(params[:price]) if params[:price].present?
        render :welcome
    end
    
    def index
        @groupbuys = Groupbuy.where(nil) # anonymous scope
        @groupbuys = @groupbuys.search(params[:search]) if params[:search].present?
        @groupbuys = @groupbuys.filter_by_status(params[:status]) if params[:status].present?
        @groupbuys = @groupbuys.sort_by_price(params[:price]) if params[:price].present?
        render :browse
    end

    def show

    end

    private

    def groupbuy_params
        params.require(:groupbuy).permit(:name, :price, :search)
    end

end
