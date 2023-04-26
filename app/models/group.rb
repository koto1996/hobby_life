class Group < ApplicationRecord
  belongs_to :owner,class_name:'Customer'
  has_many :group_users,dependent: :destroy
  has_many :customers,through: :group_users,source: :customer,dependent: :destroy
  has_many :chats,dependent: :destroy
  has_one_attached :image
  validates :name,presence: true,uniqueness: true
  validates :introduction,presence: true

  def get_image
    (image.attached?)? image: 'no_image.jpg'
  end

  def is_owned_by?(customer)
    owner.id == customer.id
  end

  def includesCustomer?(customer)
    group_users.exists?(customer_id: customer.id)
  end
end
