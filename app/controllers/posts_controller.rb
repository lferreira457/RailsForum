class PostsController < ApplicationController

	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all.order("created_at DESC")
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = current_user.posts.build
		@categories = Category.all.order('title')
	end

	def create
		@category = Category.find_by_id(post_params[:category])
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@categories = Category.all.order('title')
	end

	def update
		
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :category_id)
	end

end
