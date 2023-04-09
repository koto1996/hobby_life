class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hobbies,dependent: :destroy
  has_many :posts,dependent: :destroy
  has_many :favorites,dependent: :destroy
  # いいねの一覧実装のため中間モデル作成/users#like 参照：https://qiita.com/kurawo___D/items/d8115ecae71164a70f18
  has_many :favorite_posts,through: :favorites,source: :post
  
  has_many :post_comments,dependent: :destroy
  
  # フォローする側
  has_many :followings,through: :relationships,source: :followed
  has_many :relationships,class_name:"Relationship",foreign_key:"follower_id",dependent: :destroy
  # フォローされる側
  has_many :followers,through: :reverse_relationships,source: :follower
  has_many :reverse_relationships,class_name:"Relationship",foreign_key:"followed_id",dependent: :destroy
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
 
  # relationshipコントローラにて使用
  def follow(customer)
    relationships.create(followed_id: customer.id)
  end
  
  def unfollow(customer)
    relationships.find_by(followed_id: customer.id).destroy
  end
  
  def following?(customer)
    followings.include?(customer)
  end
  
  def self.search_for(content,method)
    if method == 'perfect'
     Customer.where(name: content)
    else
     Customer.where('name LIKE ?','%'+content+'%')
    end
  end
end