class CommentsController < ApplicationController

	before_action :get_post_and_comments, :handle_unauthorized_users, only: [:edit, :update, :destroy]
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:comment))
		@comment.user_id = current_user.id if current_user

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def edit
	end

	def update

		if @comment.update(params[:comment].permit(:comment))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to post_path(@post)
	end


	private
	
	def get_post_and_comments
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])	
	end

	def handle_unauthorized_users
		
		if(@comment.user != current_user)
			redirect_to post_path(@post)
		end
	end
end
