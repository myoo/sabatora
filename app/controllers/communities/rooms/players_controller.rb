class Communities::Rooms::PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  before_action :set_community_and_rooms

  before_filter :authenticate_user!, except: [:index, :show]

  # GET /communities/rooms/players
  # GET /communities/rooms/players.json
  def index
    @players = Player.all
  end

  # GET /communities/rooms/players/1
  # GET /communities/rooms/players/1.json
  def show
  end

  # GET /communities/rooms/players/new
  def new
    @player = Player.new
    @player.user = current_user
    @player.room = @room
  end

  # GET /communities/rooms/players/1/edit
  def edit
  end

  # POST /communities/rooms/players
  # POST /communities/rooms/players.json
  def create
    @player = Player.new(player_params)
    @player.user = current_user

    respond_to do |format|
      if @player.save
        format.html { redirect_to [@community, @room, @player], notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/rooms/players/1
  # PATCH/PUT /communities/rooms/players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to [@community, @room, @player], notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @communities_rooms_player }
      else
        format.html { render :edit }
        format.json { render json: @communities_rooms_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/rooms/players/1
  # DELETE /communities/rooms/players/1.json
  def destroy
    @communities_rooms_player.destroy
    respond_to do |format|
      format.html { redirect_to communities_rooms_players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    def set_community_and_rooms
      @community = Community.find(params[:community_id])
      @room = Room.find(params[:room_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:player_role_id, :character_id, :room_id)
    end
end