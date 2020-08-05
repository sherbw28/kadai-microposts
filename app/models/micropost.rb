class Micropost < ApplicationRecord
  belongs_to :user
  has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'micropost_id', dependent: :destroy
  has_many :liked, through: :reverses_of_favorite, source: :user, dependent: :destroy
  
  validates :content, presence: true, length: { maximum: 255 }
  
end
