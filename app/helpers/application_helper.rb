module ApplicationHelper

	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

 #  def return_interest_path(interest)
	# 	case interest.name
	# 	when "Running"
	# 		running_path
	# 	when "Yoga"
	# 		yoga_path
	# 	when "Pilates"
	# 		pilates_path
	# 	when "Healthy Eating"
	# 		healthy_eating_path
	# 	when "Swimming"
	# 		swimming_path
	# 	when "Calisthenics"
	# 		calisthenics_path
	# 	when "Weight Lifting"
	# 		weight_lifting_path
	# 	when "Cardio"
	# 		cardio_path
	# 	when "Boxing"
	# 		boxing_path
	# 	when "Hiking"
	# 		hiking_path
	# 	when "Cycling"
	# 		cycling_path
	# 	when "Extreme Sports"
	# 		extreme_sports_path
	# 	else
	# 		explore_path
	# 	end
	# end
  
end
