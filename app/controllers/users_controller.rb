class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show, :user_goals, :user_follows, :follow, :unfollow]

  def follow
    @relationship = Relationship.new(follower_id: current_user.id, followed_id: @user.id)
    if @relationship.save
      flash[:notice] = "Followed!"
      redirect_to @user
    else
      flash[:alert] = "Could not follow"
      redirect_to @user
    end
  end

  def unfollow
    @relationship = Relationship.where(follower_id: current_user.id, followed_id: @user.id).first
    if @relationship and @relationship.destroy
      flash[:notice] = "Unfollowed!"
      redirect_to @user
    else
      flash[:alert] = "Could not unfollow"
      redirect_to @user
    end
  end

  def index
    @users = User.first(20)
    @posts = Post.first(20)
    @posts = Post.order('created_at ASC')
  end

  def show
    @post = Post.new
    @comment = Comment.new
    @goal = Goal.new
  end

  def user_goals
    @goal = Goal.new
  end

  def user_follows
  end

  def new
    @user = User.new
    @post = Post.new
    @comment = Comment.new
  end

  def interests
    @interests = Interest.find(params[:interests])
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




















