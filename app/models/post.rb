class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', inverse_of: :posts
  belongs_to :category
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy
  has_many :users_with_likes, source: :user, through: :likes

  validates :title, presence: true
  validates :body, presence: true
end
