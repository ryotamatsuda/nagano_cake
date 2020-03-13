class Address < ApplicationRecord
  belongs_to :end_user
  def other_address_info
    return "〒#{self.post_code}　住所：#{self.street_address}　宛名：#{self.name}"
  end
end
