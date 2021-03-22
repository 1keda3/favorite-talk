class RoomTagForm
  include ActiveModel::Model
  attr_accessor :title, :tag_name

  with_options presence: true do
    validates :tag_name
    validates :title
  end

  def save
    room = Room.create(title: title)
    tag = Tag.where(tag_name: tag_name)

    RoomTag.create(room_id: room.id, tag_id: tag.ids)
  end

end