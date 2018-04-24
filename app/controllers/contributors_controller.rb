class ContributorsController < ApplicationController
  before_action :set_contributor, only: [:show, :edit, :update, :destroy]

  # GET /contributors
  # GET /contributors.json
  def index
    @contributors = get_contributors
  end

  # GET /contributors/1
  # GET /contributors/1.json
  def show
  end

  # GET /contributors/new
  def new
    @contributor = Contributor.new
  end

  # GET /contributors/1/edit
  def edit
  end

  # POST /contributors
  # POST /contributors.json
  def create
    @contributor = Contributor.new(contributor_params)

    respond_to do |format|
      if @contributor.save
        format.html { redirect_to @contributor, notice: 'Contributor was successfully created.' }
        format.json { render :show, status: :created, location: @contributor }
      else
        format.html { render :new }
        format.json { render json: @contributor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contributors/1
  # PATCH/PUT /contributors/1.json
  def update
    respond_to do |format|
      if @contributor.update(contributor_params)
        format.html { redirect_to @contributor, notice: 'Contributor was successfully updated.' }
        format.json { render :show, status: :ok, location: @contributor }
      else
        format.html { render :edit }
        format.json { render json: @contributor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contributors/1
  # DELETE /contributors/1.json
  def destroy
    @contributor.destroy
    respond_to do |format|
      format.html { redirect_to contributors_url, notice: 'Contributor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def unassigned
    @contributors = get_contributors.unassigned
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contributor
      @contributor = Contributor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contributor_params
      params.require(:contributor).permit(:code, :first_name, :last_name, :business_unit_id, :workplace_id, :workroom_id, :site_id)
    end

    def get_contributors
      contributors = Contributor.includes(:business_unit, :site, :workplace, workroom: [:floor])
      contributors = contributors.where(site_id: params[:site_id]) if params[:site_id]
      contributors
    end
end
