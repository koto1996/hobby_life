class Chat < ApplicationRecord
  has_many :customer,through: :group_users,source: :customer,dependent: :destroy
  belongs_to :group
  has_many :group_users,dependent: :destroy
  
  validates :message,presence: true
end
