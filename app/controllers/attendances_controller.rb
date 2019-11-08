class AttendancesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_event
    before_action :set_attendance, only: [:destroy]
    before_action :has_access?, except: [:new, :create, :destroy]
    before_action :set_administrator, only: [:index]


  def new
    @attendance = Attendance.new
  end 

  def create
    @attendance = Attendance.new(a_params)
    
    unless is_free?
      @amount = @attendance.event.price * 100
      customer = Stripe::Customer.create({
          email: stripe_params[:stripeEmail],
          source: stripe_params[:stripeToken],
      })
      @attendance.stripe_customer_id = customer.id
      charge = Stripe::Charge.create({
          customer: customer.id,
          amount: @amount,
          description: 'Rails Stripe customer',
          currency: 'eur',
      })
    end

    if @attendance.save!
        flash[:success] = "Nouvelle participation à l'évenement enregistrée"
        redirect_to event_path(a_params[:event_id])    
    else 
        flash[:danger] = "erreur"
        redirect_to event_path(a_params[:event_id])    
    end

    rescue Stripe::CardError => e
    flash[:danger] = e.message
    redirect_to event_path(a_params[:event_id])
  end

  def index
    @attendees = @event.users
  end 

def destroy
  @attendance.destroy
  flash[:warning] = "Ok, on ne t'y verra pas. Dommage..."
  redirect_to @event
end

  private

  def a_params
    puts "je suis dans a_params"
    puts params[:user_id]
    puts params[:event_id]
    params.permit(:user_id, :event_id)
  end

  def stripe_params
    puts "je suis dans stripe_params"
    puts params[:stripeEmail]
    puts params[:stripeToken]
    puts params[:stripeTokenType]
    params.permit(:stripeToken, :stripeTokenType, :stripeEmail)
  end 

  def set_event
    @event = Event.find(params[:event_id])
  end 

  def set_administrator
    @administrator = @event.administrator
  end

  def set_attendance
    @attendance = @event.attendances.find{ |attendance| attendance.user == current_user }
  end

end
