class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    validates :email, presence: true, uniqueness: { message: "Cet email appartient déjà à un utilisateur" } 

    has_many :attendances
    has_many :events, through: :attendances
    has_many :administrated_events, foreign_key: 'administrator_id', class_name: "Event"

    after_create :welcome_send

    def welcome_send
        NewUserMailer.welcome_email(self).deliver_now
    end
end
