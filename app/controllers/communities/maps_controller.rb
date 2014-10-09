# -*- coding: utf-8 -*-
class Communities::MapsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_map, only: [:show, :edit, :update, :destroy]
  before_action :set_community

  # GET /communities/maps
  # GET /communities/maps.json
  def index
    @maps = Map.available(current_user)
  end

  # GET /communities/maps/1
  # GET /communities/maps/1.json
  def show
  end

  # GET /communities/maps/new
  def new
    @map = Map.new
  end

  # GET /communities/maps/1/edit
  def edit
  end

  # POST /communities/maps
  # POST /communities/maps.json
  def create
    @map = Map.new(map_params)
    @map.community = @community
    @map.user = current_user

    respond_to do |format|
      if @map.save
        format.html { redirect_to [@community, @map], notice: 'マップを作成しました。' }
        format.json { render :show, status: :created, location: @map }
      else
        format.html { render :new }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/maps/1
  # PATCH/PUT /communities/maps/1.json
  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to [@community, @map], notice: 'マップを更新しました。' }
        format.json { render :show, status: :ok, location: [@community, @map] }
      else
        format.html { render :edit }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/maps/1
  # DELETE /communities/maps/1.json
  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to community_maps_url(@community), notice: 'マップを削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    def set_community
      @community = Community.find(params[:community_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:title, :about, :description, :image, :access)
    end
end
