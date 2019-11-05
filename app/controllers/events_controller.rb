class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end 

  def create
    @event.Event.new(
      title: params[:title],
      description: params[:description],
      price: params[:price],
      duration: params[:duration],
      start_date: params[:start_date]
    )

    if @event.save
      flash[:success] = "Ton événement a bien été créé"
      redirect_to root_path
    else
      flash[:danger] = "L'événement n'a pas pu être créé"
      render new_user_path
    end 
  end 
end
