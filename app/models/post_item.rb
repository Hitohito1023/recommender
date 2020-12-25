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

  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    when 'likes'
      return find(Favorite.group(:post_item_id).order(Arel.sql('count(post_item_id) desc')).pluck(:post_item_id))
    when 'dislikes'
      return find(Favorite.group(:post_item_id).order(Arel.sql('count(post_item_id) asc')).pluck(:post_item_id))
    end
  end

end
