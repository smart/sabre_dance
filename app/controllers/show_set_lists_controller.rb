class ShowSetListsController < ApplicationController
  # GET /show_set_lists
  # GET /show_set_lists.xml
  def index
    @show_set_lists = ShowSetList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @show_set_lists }
    end
  end

  # GET /show_set_lists/1
  # GET /show_set_lists/1.xml
  def show
    @show_set_list = ShowSetList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @show_set_list }
    end
  end

  # GET /show_set_lists/new
  # GET /show_set_lists/new.xml
  def new
    @show_set_list = ShowSetList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @show_set_list }
    end
  end

  # GET /show_set_lists/1/edit
  def edit
    @show_set_list = ShowSetList.find(params[:id])
  end

  # POST /show_set_lists
  # POST /show_set_lists.xml
  def create
    @show_set_list = ShowSetList.new(params[:show_set_list])

    respond_to do |format|
      if @show_set_list.save
        flash[:notice] = 'ShowSetList was successfully created.'
        format.html { redirect_to(@show_set_list) }
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
    @show_set_list.destroy

    respond_to do |format|
      format.html { redirect_to(show_set_lists_url) }
      format.xml  { head :ok }
    end
  end
end
