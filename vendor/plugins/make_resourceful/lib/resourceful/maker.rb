require 'resourceful/default/accessors'
require 'resourceful/default/urls'

module Resourceful
  # This module is extended by the ActionController::Base class object.
  # It provides the actual +make_resourceful+ method
  # and sets up the controller so that everything will work.
  module Maker
    # Called automatically on ActionController::Base.
    # Initializes various inheritable attributes.
    module ClassMethods
      def self.extended(base)
        base.write_inheritable_attribute :parents, []
      end

      def belongs_to(*parents)
        @parents = parents.map(&:to_s)
      end

      def add_helpers
        helper_method(:object_path, :objects_path, :new_object_path, :edit_object_path,
                      :object_url, :objects_url, :new_object_url, :edit_object_url,
                      :parent_path, :parent_url, :edit_parent_path, :edit_parent_url,
                      :nested_object_path, :nested_object_url, :edit_nested_object_path, :edit_nested_object_url,
                      :current_objects, :current_object, :current_model, :current_model_name,
                      :namespaces, :instance_variable_name, :parent_names, :parent_name,
                      :parent?, :parent_model, :parent_object, :save_succeeded?)
      end
    end

    module InstanceMethods

      def self.included(base)
        include Resourceful::Default::Accessors
        include Resourceful::Default::URLs
      end
    end

    def self.included(base)
      include Resourceful::Maker::InstanceMethods
    end




  end
end
