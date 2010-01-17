# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  write_inheritable_attribute :parents, []
  include Resourceful::Default::Accessors
  include Resourceful::Default::URLs
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  acts_as_iphone_controller
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def band_tags
    @band_tags ||= ["inverted", "unfinished", "beginning only", "ending only", "middle only", "perfume", "tractor-beam", "techno", "dub", "drum & bass"].collect{|de| Tag.find_or_create_by_name(de)}
  end
  helper_method :band_tags

  def self.belongs_to(*parents)
    @parents = parents.map(&:to_s)
  end

  helper_method(:object_path, :objects_path, :new_object_path, :edit_object_path,
                :object_url, :objects_url, :new_object_url, :edit_object_url,
                :parent_path, :parent_url, :edit_parent_path, :edit_parent_url,
                :nested_object_path, :nested_object_url, :edit_nested_object_path, :edit_nested_object_url,
                :current_objects, :current_object, :current_model, :current_model_name,
                :namespaces, :instance_variable_name, :parent_names, :parent_name,
                :parent?, :parent_model, :parent_object, :save_succeeded?)



  #LOGIN
  def login_required
    logged_in? || access_denied
  end

  def access_denied
    respond_to do |format|
      format.html do
        flash[:error] = "You must be authenticated to perform this action"
        store_location
        redirect_to login_url
      end
      format.any do
        request_http_basic_authentication 'Web Password'
      end
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def authenticate(password)
    if Digest::SHA1.hexdigest(password.to_s) == ADMIN_PASSWORD_HASH
      self.logged_in = true
      true
    else
      self.logged_in = false
      false
    end
  end

  def logged_in
    @logged_in ||= login_from_session || login_from_params
  end

  def login_from_session
    session[:logged_in]
  end

  def logged_in=(value)
    session[:logged_in] = value || false
    @logged_in = value || false
  end

  def logout
    session[:logged_in] = false
    @logged_in = false
  end


  def logged_in?
    logged_in ? true : false
  end

  def subdomain_nested?
    false
  end

  #allows the login from authentication params
  def login_from_params
    authenticate(params[:password])
  end

end
