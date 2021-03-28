class Tag < ApplicationRecord
  has_many :room_tag_relations
  has_many :rooms, through: :room_tag_relations

  validates :name, uniqueness: { case_sensitive: true }
end