class PostItem < ApplicationRecord

  belongs_to :user

  attachment :image
  belongs_to :genre

  has_many :post_comments, dependent: :destroy

end
