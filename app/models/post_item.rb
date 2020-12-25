class PostItem < ApplicationRecord

  belongs_to :user

  attachment :image
  belongs_to :genre

  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    PostItem.where('name LIKE ?', '%'+content+'%')
  end

end
