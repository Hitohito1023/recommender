class PostItem < ApplicationRecord

  belongs_to :user

  attachment :image
end
