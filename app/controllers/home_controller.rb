class HomeController < ApplicationController

	def index
		if current_user
			redirect_to users_path
		end
	end

	def explore
		@users = User.first(20)
		@posts = Post.first(20)
	end

end