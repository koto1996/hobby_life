class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hobbies,dependent: :destroy
  has_many :posts,dependent: :destroy
         
  validates :name,presence: true, length: {in: 2..10}#2文字から10文字以内であるか 
  validates :email,presence: true, uniqueness: true#重複していないか
  validates :birthday,presence: true
end
