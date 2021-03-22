class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :tags, through: :room_tags
  has_many :room_tags, dependent: :destroy

  validates :title, presence: true
end
