class GoalsController < ApplicationController
	before_action :set_goal, only: [:show, :edit, :update, :destroy]

	def index
		@goals = Goals.all
	end

	def show
	end

	def new
		@goal = Goal.new
	end

	def create
		@goal = Goal.new(goal_params)
		@goals = Goal.order('created_at DESC')
		if @goal.save
			flash[:notice] = "New goal!"
			redirect_to user_goals_user_path(current_user)
		else
			flash[:notice] = "Something went wrong."
			render :new
		end		
	end

	def edit
	end

	def update
		if @goal.update(goal_params)
			flash[:notice] = "Goal updated"
			redirect_to user_goals_user_path(current_user)
		else
			flash[:alert] = "Something went wrong."
			render :edit
		end
	end

	def destroy
		@goal.destroy
		flash[:notice] = "Goal deleted"
		redirect_to user_goals_user_path(current_user)
	end

	private
	def goal_params
		params.require(:goal).permit(:body, :timeline).merge(user_id: current_user.id)
	end

	def set_goal
		@goal = Goal.find(params[:id])
	end

end












