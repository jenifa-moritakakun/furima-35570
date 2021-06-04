class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number,
                :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /[0-9]{,11}/ }
    validates :token
  end

  with_options numericality: { other_than: 1 } do
    validates :shipping_area_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end

