class SetListsController < ApplicationController
  # GET /set_lists
  # GET /set_lists.xml
  def index
    @set_lists = SetList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @set_lists }
    end
  end

  def sort
    @set_list = SetList.find(params[:id])
    @set_list.song_performances.each do |sp|
      sp.position = params['song_performance_ids'].index(sp.id.to_s) + 1
      sp.save!
    end
    render :nothing => true
  end

  # GET /set_lists/1
  # GET /set_lists/1.xml
  def show
    @set_list = SetList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @set_list }
    end
  end

  # GET /set_lists/new
  # GET /set_lists/new.xml
  def new
    @set_list = SetList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @set_list }
    end
  end

  # GET /set_lists/1/edit
  def edit
    @set_list = SetList.find(params[:id])
  end

  # POST /set_lists
  # POST /set_lists.xml
  def create
    @set_list = SetList.new(params[:set_list])

    respond_to do |format|
      if @set_list.save
        flash[:notice] = 'SetList was successfully created.'
        format.html { redirect_to(@set_list) }
        format.xml  { render :xml => @set_list, :status => :created, :location => @set_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @set_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /set_lists/1
  # PUT /set_lists/1.xml
  def update
    @set_list = SetList.find(params[:id])

    respond_to do |format|
      if @set_list.update_attributes(params[:set_list])
        flash[:notice] = 'SetList was successfully updated.'
        format.html { redirect_to(@set_list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @set_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /set_lists/1
  # DELETE /set_lists/1.xml
  def destroy
    @set_list = SetList.find(params[:id])
    @set_list.destroy

    respond_to do |format|
      format.html { redirect_to(set_lists_url) }
      format.xml  { head :ok }
    end
  end
end
