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
    @event = page_event
  end

  def subscribe
    @event = page_event
    if @event.users.include? current_user 
      flash[:success] = "Vous participez déjà à l'événement"
      redirect_to @event 
    else 
      @event.users << current_user 
      flash[:success] = "Vous participez à l'événement"
      redirect_to @event 
    end 
  end

  private

  def page_event
    Event.find(params[:id])
  end 

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :administrator_id)
  end
end
