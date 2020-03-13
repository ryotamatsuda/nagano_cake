class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_paranoid
  validates :email, presence: true
  has_many :addresses
  has_many :cart_items
  has_many :orders

  def full_name
    return self.last_name + self.first_name
  end
  def address_info
    return '〒' + self.post_code + "住所：" + self.street_address + "宛名：" + self.full_name
  end
  def cart_items_total_price
    total_price = 500
    self.cart_items.each do |c_i|
      total_price += c_i.item.price*c_i.count
    end
    return total_price
  end
end
