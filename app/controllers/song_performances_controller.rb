class SongPerformancesController < ApplicationController
  # GET /song_performances
  # GET /song_performances.xml
  def index
    @song_performances = SongPerformance.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @song_performances }
    end
  end

  # GET /song_performances/1
  # GET /song_performances/1.xml
  def show
    @song_performance = SongPerformance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @song_performance }
    end
  end

  # GET /song_performances/new
  # GET /song_performances/new.xml
  def new
    @song_performance = SongPerformance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @song_performance }
    end
  end

  # GET /song_performances/1/edit
  def edit
    @song_performance = SongPerformance.find(params[:id])
  end

  # POST /song_performances
  # POST /song_performances.xml
  def create
    @song_performance = SongPerformance.new(params[:song_performance])

    respond_to do |format|
      if @song_performance.save
        flash[:notice] = 'SongPerformance was successfully created.'
        format.html { redirect_to(@song_performance) }
        format.xml  { render :xml => @song_performance, :status => :created, :location => @song_performance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song_performance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /song_performances/1
  # PUT /song_performances/1.xml
  def update
    @song_performance = SongPerformance.find(params[:id])

    respond_to do |format|
      if @song_performance.update_attributes(params[:song_performance])
        flash[:notice] = 'SongPerformance was successfully updated.'
        format.html { redirect_to(@song_performance) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @song_performance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /song_performances/1
  # DELETE /song_performances/1.xml
  def destroy
    @song_performance = SongPerformance.find(params[:id])
    @song_performance.destroy

    respond_to do |format|
      format.html { redirect_to(song_performances_url) }
      format.xml  { head :ok }
    end
  end
end
