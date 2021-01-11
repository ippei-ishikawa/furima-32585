class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Input half-width characters' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters' }
    validates :house_number, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters' }
    validates :phone_number, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
    validates :item_id
    validates :user_id
    validates :token
  end
  validates :phone_number, length: { maximum: 11 } 
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
 