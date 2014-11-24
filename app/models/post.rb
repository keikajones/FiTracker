class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	# scope :subscribed, ->(followeds) { where user_id: followeds }

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "120x120>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
