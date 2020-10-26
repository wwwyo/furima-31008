class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アソシエーション
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :genre
  belongs_to_active_hash :state
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_date

  # バリデーション
  with_options presence: true do
    validates :image
    validates :title
    validates :text
    with_options numericality: { other_than: 1 } do
      validates :genre_id
      validates :state_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :delivery_date_id
    end
    validates :price, numericality: { only_integer: true,
                                      greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
