class Tag < ApplicationRecord
  has_many :room_tag_relations
  has_many :rooms, through: :room_tag_relations

  validates :name, uniqueness: { case_sensitive: true }

  def self.search(search)
    if search != ""
      Tag.where('name LIKE(?)', "%#{search}%")
    else
      Tag.all
    end
  end

end