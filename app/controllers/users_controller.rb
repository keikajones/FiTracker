class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show, :user_goals, :edit, :update, :follow, :unfollow]

  def follow
    @rel = Relationship.new(follower_id: current_user.id, followed_id: @user.id)
    if @rel.save
      flash[:notice] = "Followed!"
      redirect_to @user
    else
      flash[:alert] = "Could not follow"
      redirect_to @user
    end
  end

  def unfollow
    @rel = Relationship.where(follower_id: current_user.id, followed_id: @user.id).first
    if @rel and @rel.destroy
      flash[:notice] = "Unfollowed!"
      redirect_to @user
    else
      flash[:alert] = "Could not unfollow"
      redirect_to @user
    end
  end

  def index
    @users = User.all
    @posts = Post.all
    @posts = Post.order('created_at ASC')
  end

  def show
    @post = Post.new
    # @posts = Post.subscribed current_user.followeds
  end

  def user_goals
    @goal = Goal.new
  end

  def new
    @user = User.new
    @post = Post.new
  end

  def edit

  end

  def create
    
  end

  def update
    
  end

  def interests
      #get the interests
      @interests = Interest.find(params[:interests])
      #loop through and create a new user_interest for each
      @interests.each do |interest|
        UserInterest.create(user_id: current_user.id, interest_id: interest.id)
      end

      redirect_to new_goal_path
  end

  private

  def set_user
		@user = User.find(params[:id])
	end

end




















