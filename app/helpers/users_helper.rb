module UsersHelper
    def is_owner?(event)
        event.administrator == current_user
    end

    def is_attending?(event)
        current_user.attendances.all.find { |a| a.event_id == event.id } != nil
    end

end
