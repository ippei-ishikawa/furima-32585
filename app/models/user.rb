class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items

         with_options presence: true do
           validates :nickname 
           validates :email, uniqueness: true
           validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
           validates :birthday

           with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
             validates :family_name
             validates :given_name
           end

           with_options format: { with: /\A[ァ-ヶ]+\z/ } do
             validates :kana_family_name
             validates :kana_given_name
           end
           
         end
end