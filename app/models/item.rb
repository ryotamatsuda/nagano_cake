class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  attachment :image
  [:name, :genre_id, :price].each do |v|
    validates v, presence: true
  end
end
