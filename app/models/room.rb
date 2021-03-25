class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :room_tag_relations
  has_many :tags, through: :room_tag_relations

  validates :title, presence: true

end
