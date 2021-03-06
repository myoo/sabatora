# -*- coding: utf-8 -*-
class Communities::JoiningsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_communities_joining, only: [:show, :edit, :update, :destroy]
  before_action :set_community, only: [:index, :new, :create]

  # cancanを入れたらcreateでひっかかったので、https://github.com/ryanb/cancan/issues/835の方法で回避
  load_and_authorize_resource through: :community, except: [:create]

  # GET /communities/joinings
  # GET /communities/joinings.json
  def index
    @community = Community.find(params[:community_id])
    @communities_joinings =Joining.where(community_id: @community.id)
  end

  # GET /communities/joinings/1
  # GET /communities/joinings/1.json
  def show
  end

  # GET /communities/joinings/new
  def new
    @communities_joining =Joining.new
  end

  # GET /communities/joinings/1/edit
  def edit
  end

  # POST /communities/joinings
  # POST /communities/joinings.json
  def create
    @communities_joining = Joining.new(communities_joining_params)

    @communities_joining.community = @community
    @communities_joining.user_id = current_user.id
    @communities_joining.role = Role.find_by(name: 'member')

    respond_to do |format|
      if @communities_joining.save
        format.html { redirect_to @community, notice: "#{@community.name}に参加を申し込みました！" }
        format.json { render :show, status: :created, location: @communities_joining }
      else
        @community = Community.find params[:community_id]
        format.html { render :new }
        format.json { render json: @communities_joining.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/joinings/1
  # PATCH/PUT /communities/joinings/1.json
  def update
    respond_to do |format|
      if @communities_joining.update(communities_joining_params)
        format.html { redirect_to @community, notice: 'メンバーを変更しました' }
        format.json { render :show, status: :ok, location: @communities_joining }
      else
        format.html { render :edit }
        format.json { render json: @communities_joining.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/joinings/1
  # DELETE /communities/joinings/1.json
  def destroy
    @communities_joining.destroy
    respond_to do |format|
      format.html { redirect_to community_joinings_path(params[:community_id]), notice: 'メンバーは削除されました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_communities_joining
      @communities_joining = Joining.find(params[:id])
      @community = Community.find(params[:community_id])
    end

    def set_community
      @community = Community.find(params[:community_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def communities_joining_params
     params.require(:joining).permit(:comment, :role_id)
    end
end
