class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	# scope :subscribed, ->(followeds) { where user_id: followeds }

	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
	do_not_validate_attachment_file_type :image

  auto_html_for :body do
    html_escape
    image
    youtube(:width => "100%", :height => 250, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
