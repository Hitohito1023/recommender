class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_items, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorites_post_items, through: :favorites, source: :post_item
  attachment :profile_image

  scope :only_valid, -> { where(is_valid: true) }

  def self.search_for(content, method)
    User.where('name LIKE ?', '%'+content+'%')
  end



end
