class WorkroomsController < ApplicationController
  before_action :set_workroom, only: [:show, :edit, :update, :destroy]

  # GET /workrooms
  # GET /workrooms.json
  def index
    @workrooms = Workroom.all
  end

  # GET /workrooms/1
  # GET /workrooms/1.json
  def show
  end

  # GET /workrooms/new
  def new
    @workroom = Workroom.new
  end

  # GET /workrooms/1/edit
  def edit
  end

  # POST /workrooms
  # POST /workrooms.json
  def create
    @workroom = Workroom.new(workroom_params)

    respond_to do |format|
      if @workroom.save
        format.html { redirect_to @workroom, notice: 'Workroom was successfully created.' }
        format.json { render :show, status: :created, location: @workroom }
      else
        format.html { render :new }
        format.json { render json: @workroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workrooms/1
  # PATCH/PUT /workrooms/1.json
  def update
    respond_to do |format|
      if @workroom.update(workroom_params)
        format.html { redirect_to @workroom, notice: 'Workroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @workroom }
      else
        format.html { render :edit }
        format.json { render json: @workroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workrooms/1
  # DELETE /workrooms/1.json
  def destroy
    @workroom.destroy
    respond_to do |format|
      format.html { redirect_to workrooms_url, notice: 'Workroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workroom
      @workroom = Workroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workroom_params
      params.require(:workroom).permit(:code, :name, :floor_id)
    end
end
