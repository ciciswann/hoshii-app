class CategoriesController < ActionController::Base
    before_action :set_category, only: %i[show edit update destroy]

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
        @category.groupbuys.build(name: " ")
    end

    def create
        @category = Category.create(category_params)
        
        if @category.save
          redirect_to @category
        else
          render 'new'
        end
    end
    
    def show;end
    
    def edit;end
    
    def update
        if @category.update(category_params)
          redirect_to @category
        else
          render 'edit'
        end
    end
    
    def destroy
        @category.destroy
        flash[:success] = "Category deleted"
        redirect_to categories_url
    end
    
    private

    def set_category
        @category = Category.find(params[:id])
    end
    
    def category_params
        params.require(:category).permit(:name,
          groupbuys_attributes: [
            :item_type,
            :name,
            :start_date,
            :end_date,
            :pricing,
            :sale_type,
            :image
          ])
      end
    end
end