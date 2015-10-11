class CategoriesController < ApplicationController
	before_action :get_categories, only: [:index, :show]
    
    def index
    end
    
    def show
        @posts = Post.where(category_id: params[:id]).order("created_at DESC")
        @category = Category.where(id: params[:id]).take
    end
    
    private
    def get_categories
       @categories = Category.all.order("title") 
    end
    
end
