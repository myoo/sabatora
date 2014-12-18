class Communities::IllustrationsController < ApplicationController
  before_action :set_communities_illustration, only: [:show, :edit, :update, :destroy]
  before_action :set_community

  before_filter :authenticate_user!

  # GET /communities/illustrations
  # GET /communities/illustrations.json
  def index
    @illustration =Illustration.new
    @illustrations =Illustration.all
  end

  # GET /communities/illustrations/1
  # GET /communities/illustrations/1.json
  def show
  end

  # GET /communities/illustrations/1/edit
  def edit
  end

  # POST /communities/illustrations
  # POST /communities/illustrations.json
  def create
    @illustration = Illustration.new(illustration_params)
    @illustration.user = current_user

    respond_to do |format|
      if @illustration.save
        format.html { redirect_to [@community, @illustration], notice: 'Illustration was successfully created.' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @illustration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/illustrations/1
  # PATCH/PUT /communities/illustrations/1.json
  def update
    respond_to do |format|
      if @illustration.update(illustration_params)
        format.html { redirect_to [@community, @illustration], notice: 'Illustration was successfully updated.' }
        format.json { render :show, status: :ok, location: [@community, @illustration] }
      else
        format.html { render :edit }
        format.json { render json: @illustration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/illustrations/1
  # DELETE /communities/illustrations/1.json
  def destroy
    @illustration.destroy
    respond_to do |format|
      format.html { redirect_to community_illustrations_url(@community), notice: 'Illustration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_communities_illustration
    set_community
    @illustration =Illustration.find(params[:id])
  end

  def set_community
    @community = Community.find(params[:community_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def illustration_params
    params.require(:illustration).permit(:name, :description, :image, :access, :character_id)
  end
end
