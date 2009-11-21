# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  acts_as_iphone_controller
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def band_tags
    @band_tags ||= ["inverted", "unfinished", "beginning only", "ending only", "middle only", "perfume", "tractor-beam", "techno", "dub", "drum & bass"].collect{|de| Tag.find_or_create_by_name(de)}
  end
  helper_method :band_tags

end
