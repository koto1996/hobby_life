class Group < ApplicationRecord
    belongs_to :owner,class_name:'Customer'
    has_many :group_users,dependent: :destroy

    has_one_attached :image
    validates :name,presence: true
    validates :introduction,presence: true

    def get_image
      (image.attached?)? image: 'no_image.jpg'
    end

    def is_owned_by?(customer)
      owner.id == customer.id
    end
  end
