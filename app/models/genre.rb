class Genre < ApplicationRecord

has_many :post_items, dependent: :destroy

end
