class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

	def show
	end

	def new
		@comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:notice] = "New Comment"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Something went wrong"
			redirect_to post_path(@post)
		end
	end

	def edit
		@post = Post.find(params[:post_id])
	end

	def update
		if @comment.update(comment_params)
			flash[:notice] = "Comment updated"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Something went wrong"
			redirect_to post_path(@post)
		end
	end

	def destroy
		@comment.destroy
		flash[:notice] = "Comment deleted"
		redirect_to post_path(@comment.post)
	end

	private

	def comment_params
		params.require(:comment).permit(:body).merge(user_id: current_user.id, post_id: @post.id)
	end

	def set_comment
		@comment = Comment.find(params[:id])
	end

end