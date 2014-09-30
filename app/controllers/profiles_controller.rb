# -*- coding: utf-8 -*-
class ProfilesController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :already_profiled, only: [:new]

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile.user = current_user
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    # プレビュー画面を挿入
    if params[:preview]
      unless @profile.valid?
        render :new
      else
        render :preview
      end
      return
    end

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @profile.attributes = profile_params.reject { |k,v| v.blank? }
    # プレビュー画面を挿入
    if params[:preview]
      unless @profile.valid?
        render :edit
      else
        render :preview
      end
      return
    end

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :introduction, :sex, :avatar, :birth, :remove_avatar, :avatar_cache)
    end

    def already_profiled
      if current_user.profile.present?
       flash[:alert] = "既にプロフィールが登録されています"
        redirect_to root_path
      end
    end
end
