class ShowSetListsController < ApplicationController
  before_filter :login_required
  # GET /show_set_lists
  # GET /show_set_lists.xml
  def index
    if show
      show.default_set_lists
      @show_set_lists = show.show_set_lists.all
      @tour = show.tour
    else
      @show_set_lists = ShowSetList.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @show_set_lists }
      format.json  { render :json => @show_set_lists }
    end
  end

  # GET /show_set_lists/new
  # GET /show_set_lists/new.xml
  def new
    @show_set_list = show.show_set_lists.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @show_set_list }
    end
  end

  def update_notes
    @show_set_list = ShowSetList.find(params[:id])
    @show_set_list.update_attribute(:notes, params[:notes])
    render :nothing => true
  end

  # POST /show_set_lists
  # POST /show_set_lists.xml
  def create
    @show_set_list = show.show_set_lists.new(params[:show_set_list])

    respond_to do |format|
      if @show_set_list.save
        flash[:notice] = 'ShowSetList was successfully created.'
        format.html { redirect_to(show_show_set_lists_url(show)) }
        format.xml  { render :xml => @show_set_list, :status => :created, :location => @show_set_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @show_set_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /show_set_lists/1
  # PUT /show_set_lists/1.xml
  def update
    @show_set_list = ShowSetList.find(params[:id])

    respond_to do |format|
      if @show_set_list.update_attributes(params[:show_set_list])
        flash[:notice] = 'ShowSetList was successfully updated.'
        format.html { redirect_to(@show_set_list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @show_set_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /show_set_lists/1
  # DELETE /show_set_lists/1.xml
  def destroy
    @show_set_list = ShowSetList.find(params[:id])
    @show = @show_set_list.show
    @show_set_list.destroy

    respond_to do |format|
      format.html { redirect_to(show_show_set_lists_url(@show)) }
      format.xml  { head :ok }
    end
  end

  private

  def show
    @show ||= Show.find_by_id(params[:show_id])
  end
end
