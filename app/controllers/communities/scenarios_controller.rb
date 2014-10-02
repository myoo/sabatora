class Communities::ScenariosController < ApplicationController
  before_action :set_scenario, only: [:show, :edit, :update, :destroy]

  # GET /communities/scenarios
  # GET /communities/scenarios.json
  def index
    @scenarios =Scenario.all
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

    respond_to do |format|
      if @scenario.save
        format.html { redirect_to @scenario, notice: 'Scenario was successfully created.' }
        format.json { render :show, status: :created, location: @scenario }
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
        format.html { redirect_to @scenario, notice: 'Scenario was successfully updated.' }
        format.json { render :show, status: :ok, location: @scenario }
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
      format.html { redirect_to scenarios_url, notice: 'Scenario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scenario
      @scenario =Scenario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scenario_params
      params[:scenario]
    end
end
