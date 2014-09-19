class PlayroomController < ApplicationController
  before_filter :authenticate_user!

  before_action :set_room
  before_action :set_character, only: [:playspace]

  # load_and_authorize_resource through: :community, class: "Room"

  def playspace
    @character = @room.character(current_user)
  end

  def get_main_chat_log
    @chat_log = Message.where(room_id: @room.id).asc(:created_at)
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

  def get_member_statuses
    html = render_to_string(partial: "member_status")
    render html: html
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room =Room.find(params[:id])
    @community = Community.find(params[:community_id])
  end

  def set_character
    @character = @room.players.find_by(user: current_user).character
    return if @character.nil?
  end

end
