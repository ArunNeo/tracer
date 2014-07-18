class TraceroutesController < ApplicationController
  before_action :set_traceroute, only: [:show, :edit, :update, :destroy]
  respond_to :json
  protect_from_forgery :except => :create

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
    params[:traceroute].each do |tr|
      Traceroute.create(:server => tr[:server], :local_ip => tr[:local_ip], :stdout => tr[:stdout], :stderr => tr[:stderr], :exit_status => tr[:exit_status], :timestamp => tr[:timestamp])
    end



    #puts "hello #{params}"
    #@hello = params
    #@hello.map { |k,v| puts "#{k} is #{v}" }
    #traceroute_params.each do |v|
    #  traceroute = Traceroute.create(v)
    #end

    respond_to do |format|
       format.all { render :nothing => true, :status => 200 }
     end
    #@traceroute = Traceroute.new(params)

    #respond_to do |format|
    #  if @traceroute.save
    #    format.html { redirect_to @traceroute, notice: 'Traceroute was successfully created.' }
    #    format.json { render action: 'show', status: :created, location: @traceroute }
    #  else
    #    format.html { render action: 'new' }
    #    format.json { render json: @traceroute.errors, status: :unprocessable_entity }
    #  end
    #end
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

  #{"traceroute"=>[{"local_ip"=>"54.191.183.40", "server"=>"www.appfolio.com", "timestamp"=>"2014-07-18 15:36:14 UTC", "stdout"=>"out", "stderr"=>"err",
  #                 "exit_status"=>"0"}, {"local_ip"=>"54.191.183.40", "server"=>"www.google.com", "timestamp"=>"2014-07-18 15:36:26 UTC", "stdout"=>"out", "stderr"=>"err", "exit_status"=>"1"}]}


    #def traceroute_params
    #  params.require(:traceroute).permit(:server ,:local_ip, :stdout, :stderr, :exit_status, :timestamp)
    #end
end
