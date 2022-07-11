class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :creator, class_name: 'User', inverse_of: :post_comments
  has_ancestry

  validates :content, presence: true

  scope :shallow, -> { where(ancestry: nil) }
end
