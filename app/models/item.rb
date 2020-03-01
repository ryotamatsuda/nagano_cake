class Item < ApplicationRecord
  belongs_to :genre
  attachment :image
  [:name, :genre_id, :price].each do |v|
    validates v, presence: true
  end
end
