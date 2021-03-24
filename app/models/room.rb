class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :tags, through: :room_tags
  has_many :room_tags, foreign_key: 'room_id'

  validates :title, presence: true
end
