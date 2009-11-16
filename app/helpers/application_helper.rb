# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def sexy_button_to(text, location, options = {})
    options[:class] = options[:class].to_s + " button"
    link_to("<span>#{text}</span>", location, options)
    #"<a class=\"button\" href=\"#{location}\"><span>#{text}</span></a>"
  end

  #need to improve this
  def sexy_submit_tag(form_id, value = "Submit", options = {})
    "<noscript><input id=\"\" type=\"submit\" >Enable javascript to remove these</noscript>" +
    "<input type=\"submit\" style='width:0px; height: 0px; border: none; padding: 0px; font-size: 0px'>" +
    "<a class=\"button\" id=\"\" onclick=\"$(\'#{form_id}\').submit();; return false;\" href=\"#\"><span>#{value}</span></a>"
  end

end

module ActionView
  module Helpers
    class FormBuilder

      def sexy_submit(value = "Save Changes", options = {})
        "<noscript><input id=\"#{object_name}_submit_standard\" value=\"#{value}\" type=\"submit\" />Enable javascript to remove these</noscript>" +
        "<input type=\"submit\" style='width:0px; height: 0px; border: none; padding: 0px; font-size: 0px'/>" +
        "<a class=\"button sexy_submit\" id=\"#{object_name}_submit\" onclick=\"$(\'#{options[:form_id] || ((@object.respond_to?(:new_record?) && @object.new_record?) ? @template.dom_id(@object) : @template.dom_id(@object, :edit))}\').submit();; return false;\" href=\"#\"><span>#{value}</span></a>"
      end
    end
  end
end