class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_one_attached :photo
end
