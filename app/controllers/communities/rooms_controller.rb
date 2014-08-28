class Communities::RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy, :playspace]
  before_action :set_community

  before_filter :authenticate_user!, except: [:index]

  # load_and_authorize_resource :community
  # load_and_authorize_resource :room, :through => :community, :shallow => true
  load_and_authorize_resource through: :community

  # GET /communities/rooms
  # GET /communities/rooms.json
  def index
    @rooms =Room.all
  end

  # GET /communities/rooms/1
  # GET /communities/rooms/1.json
  def show
  end

  # GET /communities/rooms/new
  def new
    @room =Room.new
    @room.community = @community
  end

  # GET /communities/rooms/1/edit
  def edit
  end

  # POST /communities/rooms
  # POST /communities/rooms.json
  def create
    @room =Room.new(room_params)
    @room.owner = current_user

    respond_to do |format|
      if @room.save
        format.html { redirect_to [@community, @room], notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/rooms/1
  # PATCH/PUT /communities/rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to [@community, @room], notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/rooms/1
  # DELETE /communities/rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to community_rooms_path(@community), notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room =Room.find(params[:id])
    end

    def set_community
      @community = Community.find(params[:community_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :about, :started_at, :community_id, :system_id, :active_background_id)
    end
end
