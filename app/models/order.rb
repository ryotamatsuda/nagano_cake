class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_items
  enum method_of_payment: ['クレジットカード', '代引き', 'コンビニ支払い']
  enum order_status: ['入金待ち','入金確認','制作中','発送準備中','発送済み']
  def order_address_info
    return "〒#{self.shopping_post_code} 住所:#{self.shopping_street_address} 宛名:#{self.shopping_name}"
  end
end
