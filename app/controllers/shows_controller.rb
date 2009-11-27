class ShowsController < ApplicationController
  include ShowsHelper
  # GET /shows
  # GET /shows.xml
  def index
    @shows = Show.find(:all, :order => "date desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shows }
      format.iphone do
         @title     = "Shows"
          @left_nav  = { :back => true, :caption => 'Back', :url => :back, :html_options => {} }
          @right_nav = { :caption => 'Home', :url => "/welcome", :html_options => {} }
          @list      = @shows.map { |i| ListModel.new( i, show_text(i), show_url(i)) }
      end
    end
  end

  def print_set_list
    @show = Show.find(params[:id])

    render :template => "shows/print_set_list", :layout => "print"
  end


  # GET /shows/1
  # GET /shows/1.xml
  def show
    @show = Show.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @show }
      format.iphone do
        @title     = "Shows"
        @left_nav  = { :back => true, :caption => 'Back', :url => :back, :html_options => {} }
        #@right_nav = { :caption => 'Home', :url => "/welcome", :html_options => {} }
      end
    end
  end

  # GET /shows/new
  # GET /shows/new.xml
  def new
    @show = Show.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @show }
    end
  end

  # GET /shows/1/edit
  def edit
    @show = Show.find(params[:id])
  end

  # POST /shows
  # POST /shows.xml
  def create
    @show = Show.new(params[:show])

    respond_to do |format|
      if @show.save
        flash[:notice] = 'Show was successfully created.'
        format.html { redirect_to(@show) }
        format.xml  { render :xml => @show, :status => :created, :location => @show }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @show.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shows/1
  # PUT /shows/1.xml
  def update
    @show = Show.find(params[:id])

    respond_to do |format|
      if @show.update_attributes(params[:show])
        flash[:notice] = 'Show was successfully updated.'
        format.html { redirect_to(@show) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @show.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.xml
  def destroy
    @show = Show.find(params[:id])
    @show.destroy

    respond_to do |format|
      format.html { redirect_to(shows_url) }
      format.xml  { head :ok }
    end
  end
end
