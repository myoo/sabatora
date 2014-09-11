class PlayroomController < ApplicationController
  before_action :set_room
  before_filter :authenticate_user!

  # load_and_authorize_resource through: :community, class: "Room"

  def playspace
  end

  def get_main_chat_log
    @chat_log = Message.where(room_id: @room.id).desc(:created_at)
    respond_to do |format|
      format.json { render json: @chat_log.to_json }
    end
  end

  def get_characters
    @characters = @room.players.pluck(:character_id)
    respond_to do |format|
      format.json { render json: @characters.to_json }
    end
  end

  def get_illustrations
    @illustrations = {}
    @room.players.order(created_at: :desc).each do |player|
      @illustrations[player.character_id] = player.character.illustrations.order(name: :desc) if player.character.present?
    end

    respond_to do |format|
      format.json { render }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room =Room.find(params[:id])
  end

end
