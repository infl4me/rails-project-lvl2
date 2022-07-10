class PostComment < ApplicationRecord
  belongs_to :post
  has_ancestry

  scope :shallow, -> { where(ancestry: nil) }
end
