class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :email, presence: true, uniqueness: true
         validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
         validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
         validates :given_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
         validates :kana_family_name, presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
         validates :kana_given_name, presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
         validates :birthday, presence: true
end