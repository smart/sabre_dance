class SystemController < ApplicationController


  def request_info
    render :template => "system/request_info.html.haml"
  end

end