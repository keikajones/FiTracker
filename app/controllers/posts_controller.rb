class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@posts = Post.order('created_at ASC')
		if @post.save
			flash[:notice] = "New post!"
			respond_to do |format|
				format.js
			end
		else
			flash[:notice] = "Something went wrong."
			render :new
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:notice] = "Post updated!"
			redirect_to @post
		else
			flash[:alert] = "Something went wrong."
			render :edit
		end
	end

	def destroy
		@post.destroy
		flash[:notice] = "Post deleted!"
		redirect_to current_user
	end

	private

	def post_params
		params.require(:post).permit(:body).merge(user_id: current_user.id)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end











