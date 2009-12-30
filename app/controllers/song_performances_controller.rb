class SongPerformancesController < ApplicationController
  # GET /song_performances
  # GET /song_performances.xml
  def index
    if set_list
      @song_performances = set_list.song_performances
    else
      @song_performances = SongPerformance.paginate :page => params[:page], :per_page => 50

    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @song_performances }
      format.json {  render :json => @song_performances.to_json(:methods => [:inverted?, :tag_list_string]) }
    end
  end

  def show
    @song_performance = set_list.song_performances.find(params[:id])
    render :partial => "song_performances/show.html.haml", :locals => {:song_performance => @song_performance, :set_list => set_list}
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
    @song_performance = set_list.song_performances.find(params[:id])
    render :partial => "song_performances/edit.html.haml", :locals => {:song_performance => @song_performance, :set_list => set_list}
  end

  # POST /song_performances
  # POST /song_performances.xml
  def create
    @song_performance = set_list.song_performances.new(params[:song_performance])

    respond_to do |format|
      if @song_performance.save!
        flash[:notice] = 'SongPerformance was successfully created.'
        #format.html { redirect_to(@song_performance) }
        #format.xml  { render :xml => @song_performance, :status => :created, :location => @song_performance }
        format.all { render :partial  => "show_set_lists/set_list.html.haml", :locals => {:set_list => set_list}}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song_performance.errors, :status => :unprocessable_entity }
      end
    end
  end

  def toggle_segue
    @song_performance = SongPerformance.find(params[:id])
    @song_performance.toggle!(:segue)
    render :partial => "song_performances/segue", :locals => {:song_performance => @song_performance}

  end

  def toggle_tag
    @song_performance = SongPerformance.find(params[:id])
    if found_tag = @song_performance.tags.find_by_id(params[:tag_id])
      p "WE MADE IT"
      @song_performance.tag_list.delete(found_tag.name)
    else
      @song_performance.tag_list << Tag.find_by_id(params[:tag_id]).name
    end
    @song_performance.save!
    render :partial => "song_performances/edit.html.haml", :locals => {:song_performance => @song_performance, :set_list => @song_performance.set_list}

  end

  def update_notes
    @song_performance = SongPerformance.find(params[:id])
    @song_performance.update_attribute(:notes, params[:notes])
    render :nothing => true
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
    set_list = @song_performance.set_list
    @song_performance.destroy

    respond_to do |format|
     format.all { render :partial  => "show_set_lists/set_list.html.haml", :locals => {:set_list => set_list}}
    end
  end

  private

   def set_list
     @set_list ||= SetList.find_by_id(params[:set_list_id])
   end
end
