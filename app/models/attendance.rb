class Attendance < ApplicationRecord
    belongs_to :event
    belongs_to :user

    after_create :confirmation

    def confirmation
        AttendanceConfirmationMailer.confirmation_email(self).deliver_now
    end
end
