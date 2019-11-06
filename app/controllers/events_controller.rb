class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end 

  def create
    @event = Event.new(event_params)
    puts event_params

    if @event.save
      flash[:success] = "Ton événement a bien été créé"
      redirect_to event_path(@event.id)
    else
      flash[:danger] = "L'événement n'a pas pu être créé"
      render new_event_path
    end 
  end

  def show
    @event = Event.find(params[:id])
  end 

  private

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :administrator_id)
  end
end
