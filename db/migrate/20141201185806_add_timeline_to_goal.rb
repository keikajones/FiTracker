class AddTimelineToGoal < ActiveRecord::Migration
  def change
  	add_column :goals, :timeline, :integer
  end
end
