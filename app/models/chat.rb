class Chat < ApplicationRecord
  belongs_to :customer
  belongs_to :group

  validates :message,presence: true
end
