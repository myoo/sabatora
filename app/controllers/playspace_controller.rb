class PlayspaceController < WebsocketRails::BaseController
  before_action :set_room
  before_action :set_character, only: [:illustration_changed]

  def illustration_changed
    @illustration = Illustration.find(message[:illustration_id])
    update_illustration
    WebsocketRails["#{@room.id}"].trigger(:illustration_changed, message)
    puts "illustration changed"
  end

  private
  def set_room
    @room =Room.find(message[:room_id])
  end

  def set_character
    @character = Character.find(message[:character_id])
  end

  def update_illustration
    @status = @character.current_status(@room.id)
    @status.illustration = @illustration
    @status.save!
  end

end
