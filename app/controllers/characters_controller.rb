# -*- coding: utf-8 -*-
class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy, :update_params, :edit_params]

  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.owned(current_user)
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
    @character.user = current_user
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_params
    @character.initialize_params
    if @character.save
      respond_to do |format|
        format.html { render :show, notice: "パラメータを振り直しました。" } # Todo:Ajax追加
      end
    end
  end

  def edit_params
    @character.paramaters = params.permit(character: [:paramaters])
    if @character.save
      respond_to do |format|
        format.json { render @character.paramaters }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:name, :about, :user_id, :system_id, :paramaters, :profile, :status, :memo, :image, illustration_ids: [])
    end
end
