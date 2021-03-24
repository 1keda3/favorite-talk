class RoomsTagForm

  include ActiveModel::Model
  attr_accessor :title, :name

  with_options presence: true do
    validates :title
    validates :name
  end

  def save
    room = Room.create(title: title)
    tag = Tag.create(name: name)

    RoomTag.create(room_id: room.id, tag_id: tag.id)
  end
end

