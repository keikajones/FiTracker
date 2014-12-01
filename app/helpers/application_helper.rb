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

  def display_timeline(goal)
		case goal.timeline
		when 1
			"Day"
		when 2
			"Week"
		when 3
			"Month"
		when 4
			"Year"
		else
			""
		end
  end
  
end
