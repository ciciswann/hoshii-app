class GroupbuysController < ApplicationController
    before_action :authenticate_user!

    def welcome
        @groupbuys = Groupbuy.search(params[:search])
        render :welcome
    end
    
    def index
        @groupbuys = Groupbuy.all
    end

    def show

    end

    private

    def groupbuy_params
        params.require(:groupbuy).permit(:name, :search)
    end
end
