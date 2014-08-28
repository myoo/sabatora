class Communities::BackgroundsController < ApplicationController
  before_action :set_background, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

layout "playroom"
  # GET /backgrounds
  # GET /backgrounds.json
  def index
    @community = Community.find(params[:community_id])
    @backgrounds = @community.backgrounds

  end

  # GET /backgrounds/1
  # GET /backgrounds/1.json
  def show
  end

  # GET /backgrounds/new
  def new
    @community = Community.find(params[:community_id])
    @background = Background.new
  end

  # GET /backgrounds/1/edit
  def edit
  end

  # POST /backgrounds
  # POST /backgrounds.json
  def create
    @background = Background.new(background_params)
    @community =  Community.find(params[:community_id])
    @background.community = @community
    @background.user = current_user

    respond_to do |format|
      if @background.save
        format.html { redirect_to [@community, @background], notice: 'Background was successfully created.' }
        format.json { render :show, status: :created, location: @background }
      else
        format.html { render :new }
        format.json { render json: @background.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backgrounds/1
  # PATCH/PUT /backgrounds/1.json
  def update
    respond_to do |format|

      if @background.update(background_params)
        format.html { redirect_to [@community, @background], notice: 'Background was successfully updated.' }
        format.json { render :show, status: :ok, location: @background }
      else
        format.html { render :edit }
        format.json { render json: @background.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backgrounds/1
  # DELETE /backgrounds/1.json
  def destroy
    @background.destroy
    respond_to do |format|
      format.html { redirect_to backgrounds_url, notice: 'Background was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_background
      @background = Background.find(params[:id])
      @community = Community.find(params[:community_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def background_params
      params.require(:background).permit(:room_id, :image, :name, :about, :user_id, :access, :community_id)
    end
end
