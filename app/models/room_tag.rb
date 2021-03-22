class RoomTag < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :tag, optional: true
end
