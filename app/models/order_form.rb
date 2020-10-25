class OrderForm

  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_prefecture_id, :delivery_town, :delivery_number, :delivery_building, :phon_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :delivery_prefecture_id, numericality: { other_than: 1 } 
    validates :delivery_town
    validates :delivery_number
    validates :phon_number, format: { with: /\A[0-9]{11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_prefecture_id: delivery_prefecture_id, delivery_town: delivery_town, delivery_number: delivery_number, delivery_building: delivery_building, phon_number: phon_number, order_id: order.id)
  end
end