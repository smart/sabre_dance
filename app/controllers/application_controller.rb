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
end
