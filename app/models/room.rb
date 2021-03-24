class Room < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :title, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
