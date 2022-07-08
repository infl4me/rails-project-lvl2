class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', inverse_of: :posts
  belongs_to :category

  validates :title, presence: true
  validates :body, presence: true
end
