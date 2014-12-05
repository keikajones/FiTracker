class InterestsController < ApplicationController

	def new
		@interests = Interest.all	
	end

	def create
		
	end

	def edit
		@user = User.find(params[:id])
		@interests = Interest.all
	end

	def update
		if param_posted?(:interests)
      if @user.interest.update_attributes(params[:interests])
          flash[:notice] = "Changes saved."
          redirect_to user_interests_user_path(@user)
      end
  	end
	end

	def destroy
		
	end

end