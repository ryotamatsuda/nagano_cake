class CartItem < ApplicationRecord
  belongs_to :end_user
  belongs_to :item
  [:end_user_id, :item_id, :count].each do |v|
    validates v, presence: true
  end
end
