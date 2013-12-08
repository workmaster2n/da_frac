class WellsController < ApplicationController
  before_action :set_well, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource


  # GET /wells
  # GET /wells.json
  def index
    @wells = Well.all
  end

  # GET /wells/1
  # GET /wells/1.json
  def show
  end

  # GET /wells/new
  def new
    @well = Well.new
  end

  # GET /wells/1/edit
  def edit
  end

  # POST /wells
  # POST /wells.json
  def create
    @well = Well.new(well_params)

    respond_to do |format|
      if @well.save
        format.html { redirect_to @well, notice: 'Well was successfully created.' }
        format.json { render action: 'show', status: :created, location: @well }
      else
        format.html { render action: 'new' }
        format.json { render json: @well.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wells/1
  # PATCH/PUT /wells/1.json
  def update
    respond_to do |format|
      if @well.update(well_params)
        format.html { redirect_to @well, notice: 'Well was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @well.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wells/1
  # DELETE /wells/1.json
  def destroy
    @well.destroy
    respond_to do |format|
      format.html { redirect_to wells_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_well
      @well = Well.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def well_params
      params.require(:well).permit(:name, :start_date)
    end
end
