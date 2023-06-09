class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :hobby
  has_many :favorites,dependent: :destroy
  has_many :post_comments,dependent: :destroy

  validates :title,presence: true
  validates :body,presence: true
  validates :hobby_id,presence: true

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  has_one_attached :image

  def get_image(width,height)
    set_default_image unless image.attached?
    image.variant(resize_to_limit: [width, height]).processed
  end
  def set_default_image
    file_path = Rails.root.join('app/assets/images/img-default.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  def self.search_for(content,method)
    if method == 'perfect'
      Post.where(title: content)
    else
      Post.where('title LIKE ?','%'+content+'%')
    end
  end
end
