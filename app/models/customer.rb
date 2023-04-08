class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hobbies,dependent: :destroy
  has_many :posts,dependent: :destroy
  has_many :favorites,dependent: :destroy
  # いいねの一覧実装のため中間モデル作成/user-
  has_many :favorite_posts,through: :favorites,source: :post
  has_one_attached :profile_image

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/img-default.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  validates :name,presence: true, length: {in: 2..10}#2文字から10文字以内であるか
  validates :email,presence: true, uniqueness: true#重複していないか
  validates :birthday,presence: true

  def self.search_for(content,method)
    if method == 'perfect'
     Customer.where(name: content)
    else
     Customer.where('name LIKE ?','%'+content+'%')
    end
  end
end