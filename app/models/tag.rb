class Tag < ApplicationRecord
  has_many :room_tags, foreign_key: 'tag_id'
  has_many :rooms, through: :room_tags

  validates :name, uniqueness: true
  
end
