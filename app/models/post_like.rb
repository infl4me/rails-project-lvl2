class PostLike < ApplicationRecord
  belongs_to :creator, class_name: 'User', inverse_of: :post_likes
  belongs_to :post
end
