class DashboardController < ApplicationController
  # GET /venues
  # GET /venues.xml
  def index
    @upcoming_shows = current_tour.shows.upcoming.find(:all, :order => "date desc")
    @past_shows = current_tour.shows.played.find(:all, :order => "date desc")
    @songs = current_tour.song_stats
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venues }
    end
  end



  helper_method :current_tour
  def current_tour
    @current_tour ||= Show.find(:first, :conditions => ["shows.date >= ?", Date.today], :order => "shows.date ASC").try(:tour)
  end
end