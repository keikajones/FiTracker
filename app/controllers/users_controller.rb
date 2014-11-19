class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show, :edit, :update, :destroy, :follow, :unfollow]

  def index
  end

  def show
  	@interest = Interest.find_by_name(params[:interest])
  end

  def edit
  end

  private

  def set_user
		@user = User.find(params[:id])
	end

end
