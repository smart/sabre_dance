class ToursController < ApplicationController
  before_filter :login_required
  # GET /tours
  # GET /tours.xml
  def index
    @tours = Tour.by_date_of_first_show

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tours }
      format.json  { render :json => @tours }
      format.iphone
    end
  end

  # GET /tours/1
  # GET /tours/1.xml
  def show
    @tour = Tour.find(params[:id])
    @upcoming_shows = @tour.shows.upcoming.find(:all, :order => "date desc")
    @past_shows = @tour.shows.played.find(:all, :order => "date desc")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tour }
      format.iphone do
        @shows = @tour.shows.find(:all, :order => "date desc").group_by {|show| (show.upcoming? ? "Upcoming Shows" : "Past Shows") }
        end
    end
  end

  # GET /tours/new
  # GET /tours/new.xml
  def new
    @tour = Tour.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tour }
    end
  end

  # GET /tours/1/edit
  def edit
    @tour = Tour.find(params[:id])
  end

  # POST /tours
  # POST /tours.xml
  def create
    @tour = Tour.new(params[:tour])

    respond_to do |format|
      if @tour.save
        flash[:notice] = 'Tour was successfully created.'
        format.html { redirect_to(@tour) }
        format.xml  { render :xml => @tour, :status => :created, :location => @tour }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tours/1
  # PUT /tours/1.xml
  def update
    @tour = Tour.find(params[:id])

    respond_to do |format|
      if @tour.update_attributes(params[:tour])
        flash[:notice] = 'Tour was successfully updated.'
        format.html { redirect_to(@tour) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.xml
  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy

    respond_to do |format|
      format.html { redirect_to(tours_url) }
      format.xml  { head :ok }
    end
  end
end
