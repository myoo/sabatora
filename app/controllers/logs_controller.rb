class LogsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def result
    @from = DateTime.civil(params[:log]["start_at(1i)"].to_i,params[:log]["start_at(2i)"].to_i,params[:log]["start_at(3i)"].to_i,params[:log]["start_at(4i)"].to_i,params[:log]["start_at(5i)"].to_i)
    @to = DateTime.civil(params[:log]["end_at(1i)"].to_i,params[:log]["end_at(2i)"].to_i,params[:log]["end_at(3i)"].to_i,params[:log]["end_at(4i)"].to_i,params[:log]["end_at(5i)"].to_i)
    @logs = Message.logs(params[:log][:room_id], @from, @to)
    @room = Room.find(params[:log][:room_id])
    @display_html = params[:log][:display]
    unless @display_html
      send_data(render_to_string(partial: "download"), :filename => "logs.html", :type => "text/html")
    end
  end

  def download
    @from = params[:log][:start_at]
    @to = params[:log][:end_at]
    @logs = Message.logs(params[:log][:room_id], @from, @to)
    @room = Room.find(params[:log][:room_id])
    send_data(render_to_string(partial: "download"), :filename => "logs.html", :type => "text/html")
  end
end
