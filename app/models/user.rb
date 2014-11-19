class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :followeds, through: :relationships
  has_many :reverse_relationships, foreign_key: :followed_id, class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :companies
  has_many :interest_users
  has_many :interests, :through => :interest_users

  accepts_nested_attributes_for :interest_users, :allow_destroy => true

  validates_presence_of :fname, :lname

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
