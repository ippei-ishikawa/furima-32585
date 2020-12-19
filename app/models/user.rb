class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :password, presence: true
         validates :family_name, presence: true
         validates :given_name, presence: true
         validates :kana_family_name, presence: true
         validates :kana_given_name, presence: true
         validates :birthday, presence: true
end