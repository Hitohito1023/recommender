class PostItem < ApplicationRecord

  belongs_to :user

  attachment :image
  belogs_to :genre
end
