class InterestsController < ApplicationController

	def index
	end

	def new
		@interests = Interest.all	
	end

	def create
			
	end

	def edit
		@user = User.find(params[:id])
		@interests = Interest.all
	end

end