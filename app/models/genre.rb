class Genre < ApplicationRecord

validates :name, presence: true



has_many :post_items, dependent: :destroy

end
