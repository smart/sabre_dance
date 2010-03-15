class FanRequestsController < ApplicationController
  protect_from_forgery :except => [:create]
  # GET /fan_requests
  # GET /fan_requests.xml
  def index
    @fan_requests = FanRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fan_requests }
      format.iphone
    end
  end

  # GET /fan_requests/1
  # GET /fan_requests/1.xml
  def show
    @fan_request = FanRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fan_request }
    end
  end

  # GET /fan_requests/new
  # GET /fan_requests/new.xml
  def new
    @fan_request = FanRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fan_request }
      format.iphone
    end
  end

  # GET /fan_requests/1/edit
  def edit
    @fan_request = FanRequest.find(params[:id])
  end

  # POST /fan_requests
  # POST /fan_requests.xml
  def create
    @fan_request = FanRequest.new(:song_id => params[:song_id], :show_id => params[:show_id], :requested_by => params[:requested_by], :notes => params[:notes] )

    respond_to do |format|
      if @fan_request.save
        flash[:notice] = 'FanRequest was successfully created.'
        #format.html { redirect_to(@fan_request) }
        #format.xml  { render :xml => @fan_request, :status => :created, :location => @fan_request }
        format.all { render :json => @fan_request}
        #format.iphone { redirect_to(fan_requests_url) }
      else
        #format.html { render :action => "new" }
        #format.xml  { render :xml => @fan_request.errors, :status => :unprocessable_entity }
        format.all { render :json => @fan_request.errors, :status => :unprocessable_entity}
        #format.iphone { render :action => "new" }
      end
    end
  end

  # PUT /fan_requests/1
  # PUT /fan_requests/1.xml
  def update
    @fan_request = FanRequest.find(params[:id])

    respond_to do |format|
      if @fan_request.update_attributes(params[:fan_request])
        flash[:notice] = 'FanRequest was successfully updated.'
        format.html { redirect_to(@fan_request) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fan_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fan_requests/1
  # DELETE /fan_requests/1.xml
  def destroy
    @fan_request = FanRequest.find(params[:id])
    @fan_request.destroy

    respond_to do |format|
      format.html { redirect_to(fan_requests_url) }
      format.xml  { head :ok }
    end
  end
end
