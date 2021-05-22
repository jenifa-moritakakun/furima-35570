class ShippingCharges < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い(購入書負担)' },
    { id: 3, name: '送料込み(出品書負担)' }
  ]

  include ActiveHash::Associations
  has_many :items
end
