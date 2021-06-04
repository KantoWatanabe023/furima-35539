class OrderResidence
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_num, :place_id, :city, :address, :building, :phone_num, :token

  with_options presence: true do
    validates :post_num,   format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :user_id
    validates :item_id
    validates :phone_num,  numericality: {only_integer: true}, length: {in: 1..11}
    validates :place_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Residence.create(post_num: post_num, place_id: place_id, city: city, address: address, building: building, phone_num: phone_num, order_id: order.id)
  end

end