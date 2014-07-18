class TraceroutesController < ApplicationController
  before_action :set_traceroute, only: [:show, :edit, :update, :destroy]

  # GET /traceroutes
  # GET /traceroutes.json
  def index
    @traceroutes = Traceroute.all
  end

  # GET /traceroutes/1
  # GET /traceroutes/1.json
  def show
  end

  # GET /traceroutes/new
  def new
    @traceroute = Traceroute.new
  end

  # GET /traceroutes/1/edit
  def edit
  end

  # POST /traceroutes
  # POST /traceroutes.json
  def create
    @traceroute = Traceroute.new(traceroute_params)

    respond_to do |format|
      if @traceroute.save
        format.html { redirect_to @traceroute, notice: 'Traceroute was successfully created.' }
        format.json { render action: 'show', status: :created, location: @traceroute }
      else
        format.html { render action: 'new' }
        format.json { render json: @traceroute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traceroutes/1
  # PATCH/PUT /traceroutes/1.json
  def update
    respond_to do |format|
      if @traceroute.update(traceroute_params)
        format.html { redirect_to @traceroute, notice: 'Traceroute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @traceroute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traceroutes/1
  # DELETE /traceroutes/1.json
  def destroy
    @traceroute.destroy
    respond_to do |format|
      format.html { redirect_to traceroutes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traceroute
      @traceroute = Traceroute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def traceroute_params
      params.require(:traceroute).permit(:local_ip, :stdout, :stderr, :exit_status, :timestamp)
    end
end
