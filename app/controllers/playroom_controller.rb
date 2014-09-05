class PlayroomController < ApplicationController
  before_action :set_room, only: [:playspace, :get_main_chat_log]
  before_filter :authenticate_user!

  # load_and_authorize_resource through: :community, class: "Room"

  def playspace
    @character = @room.character(current_user)
  end

  def get_main_chat_log
    @chat_log = Message.where(room_id: @room.id).desc(:created_at)
    respond_to do |format|

      format.json { render json: @chat_log.to_json }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room =Room.find(params[:id])
    @community = Community.find(params[:community_id])
  end

end
