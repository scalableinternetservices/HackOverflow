class Cart < ApplicationRecord
  belongs_to :item
  #validates :buyer_id, presence: true
  #validates :item_id, presence: true
end
