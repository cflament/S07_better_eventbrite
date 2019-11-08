class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:destroy, :edit, :show]
  before_action :set_administrator, only: [:edit]

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

  def edit
    puts params
  end

  def update
    puts event_params
  end

  def show
  end

  def destroy
    deleted_event_title = @event.title
    @event.destroy
    flash[:warning] = "Ton évènement '#{deleted_event_title}' a bien été supprimé. Tu te sens mieux ?"
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :administrator_id)
  end

  def set_administrator
    @administrator = @event.administrator
  end

  def set_event
    @event = Event.find(params[:id])
  end 
end
