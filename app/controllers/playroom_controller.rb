class PlayroomController < ApplicationController
  before_action :set_room, only: [:playspace]
  before_filter :authenticate_user!

  # load_and_authorize_resource through: :community, class: "Room"

  def playspace
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room =Room.find(params[:id])
  end

end
