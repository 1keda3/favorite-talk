class Tag < ApplicationRecord
  has_many :room_tags
  has_many :rooms, through: :room_tags

  validates :tag_name, uniqueness: true
  
end
