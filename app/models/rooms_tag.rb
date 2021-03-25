class RoomsTag

  include ActiveModel::Model
  attr_accessor :title, :name

  with_options presence: true do
    validates :title
    validates :name
  end

  def save
    room = Room.create(title: title)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    RoomTagRelation.create(room_id: room.id, tag_id: tag.id)
  end

end