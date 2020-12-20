class PostItem < ApplicationRecord

  belongs_to :user

  attachment :image
  belongs_to :genre
end
