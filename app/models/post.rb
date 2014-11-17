class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	# scope :subscribed, ->(followeds) { where user_id: followeds }
end
