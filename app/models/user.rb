# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'creator_id', dependent: :destroy, inverse_of: :creator
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :posts_with_likes, source: :post, through: :post_likes

  def find_like(post)
    post_likes.find_by(post_id: post.id)
  end
end
