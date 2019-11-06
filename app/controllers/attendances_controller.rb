class AttendancesController < ApplicationController
    before_action :authenticate_user!
  def new
    puts @event = Event.find(params[:event_id])
  end

  def create
    @attendance = Attendance.new(user_id: current_user.id, event_id: page_event.id)

    if @attendance.save
        redirect_to event_path(page_event.id) 
    else 
        flash[:danger] = "erreur"
    end 
  end 

  private

  def page_event
    Event.find(params[:id])
  end 

end