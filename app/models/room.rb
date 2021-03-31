class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :room_tag_relations
  has_many :tags, through: :room_tag_relations

  validates :title, presence: true

  def self.search(search)
    if search != ""
      Room.where('title LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end

end
