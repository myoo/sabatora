# -*- coding: utf-8 -*-
class Communities::ScenariosController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  before_action :set_scenario, only: [:show, :edit, :update, :destroy]
  before_action :set_community

  # GET /communities/scenarios
  # GET /communities/scenarios.json
  def index
    @scenarios =Scenario.available.all
  end

  # GET /communities/scenarios/1
  # GET /communities/scenarios/1.json
  def show
  end

  # GET /communities/scenarios/new
  def new
    @scenario =Scenario.new
  end

  # GET /communities/scenarios/1/edit
  def edit
  end

  # POST /communities/scenarios
  # POST /communities/scenarios.json
  def create
    @scenario =Scenario.new(scenario_params)
    @scenario.user = current_user
    @scenario.community = @community

    respond_to do |format|
      if @scenario.save
        format.html { redirect_to [@community, @scenario], notice: 'Scenario was successfully created.' }
#        format.json { render :show, status: :created, location: @scenario }
      else
        format.html { render :new }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/scenarios/1
  # PATCH/PUT /communities/scenarios/1.json
  def update
    respond_to do |format|
      if @scenario.update(scenario_params)
        format.html { redirect_to [@community, @scenario], notice: 'シナリオが更新されました。' }
#        format.json { render :show, status: :ok, location: @scenario }
      else
        format.html { render :edit }
        format.json { render json: @scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/scenarios/1
  # DELETE /communities/scenarios/1.json
  def destroy
    @scenario.destroy
    respond_to do |format|
      format.html { redirect_to community_scenarios_url(@community), notice: 'シナリオが削除されました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scenario
      @scenario =Scenario.find(params[:id])
    end

    def set_community
      @community = Community.find(params[:community_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scenario_params
      params.require(:scenario).permit(:name, :access, :about, :description, :system_id)
    end
end
