class CategoriesController < ApplicationController
    def index
        @categories = Category.all.order("title")
    end
    
    def show
        @posts = Post.where(category_id: params[:id]).order("created_at DESC")
        @category = Category.where(id: params[:id]).take
    end
    
end
