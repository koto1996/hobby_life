class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # ゲストログイン 参照:https://qiita.com/take18k_tech/items/35f9b5883f5be4c6e104
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
    customer.password = SecureRandom.urlsafe_base64
    customer.name = "guest"
    customer.birthday = "2000/1/1"
    end
  end

  has_many :hobbies,dependent: :destroy
  has_many :posts,dependent: :destroy
  # いいね機能
  has_many :favorites,dependent: :destroy
  # いいねの一覧実装のため中間モデル作成/users#like 参照：https://qiita.com/kurawo___D/items/d8115ecae71164a70f18
  has_many :favorite_posts,through: :favorites,source: :post
  # コメント機能
  has_many :post_comments,dependent: :destroy
  # グループ機能
  has_many :group_users,dependent: :destroy
  has_many :groups,through: :group_users,source: :customer,dependent: :destroy
  # グループチャット機能
  has_many :chats,dependent: :destroy
  # フォローする側
  has_many :relationships,foreign_key: "following_id",dependent: :destroy
  has_many :followings,through: :relationships,source: :follower
  # フォローされる側
  has_many :reverse_relationships,class_name: "Relationship",foreign_key: :follower_id,dependent: :destroy
  has_many :followers,through: :reverse_relationships,source: :following

  has_one_attached :profile_image

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  validates :name,presence: true, length: {in: 2..20}#2文字から20文字以内であるか
  validates :email,presence: true, uniqueness: true#重複していないか
  validates :birthday,presence: true
  # 退会機能実施 参照:https://qiita.com/tt_tsutsumi/items/588d0e65a289a15530d2
  def active_for_authentication?
    super && (self.is_withdraw == false)
  end
  # relationshipコントローラにて使用
  def follow(user)
    relationships.create(follower_id: user.id)
  end

  def unfollow(user)
    relationships.find_by(follower_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def self.search_for(content,method)
    if method == 'perfect'
     Customer.where(name: content)
    else
     Customer.where('name LIKE ?','%'+content+'%')
    end
  end
end