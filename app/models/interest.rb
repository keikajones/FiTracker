class Interest < ActiveRecord::Base
	has_many :interest_users

	validates_presence_of :name
end
