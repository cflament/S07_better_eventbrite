module EventsHelper
  def is_free?
    !@event.price
  end
end
