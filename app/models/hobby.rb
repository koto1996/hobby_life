class Hobby < ApplicationRecord
  belongs_to :customer
  has_many :posts,dependent: :destroy

  validates :name,presence: true

  def self.search_for(content,method)
    if method == 'perfect'
      Hobby.where(name: content)
    else
      Hobby.where('name LIKE ?', '%'+content+'%')
    end
  end
end
