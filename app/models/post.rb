class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :comments

	validates :title, presence: true
	validates :category, presence: true
end
