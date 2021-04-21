class GroupbuysController < ApplicationController
    def index
        render({json: Groupbuy.all})
    end

    private

    # def groupbuy_params
    #     params.require
    # end
end
