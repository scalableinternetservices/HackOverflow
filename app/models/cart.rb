class Cart < ApplicationRecord
  belongs_to :item
  belongs_to :buyer
  validates :buyer_id, presence: true
  validates :item_id, presence: true
end
