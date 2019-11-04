class User < ApplicationRecord
    validates :email, presence: true, uniqueness: { message: "Cet email appartient déjà à un utilisateur" } 

    has_many :attendances
    has_many :events, through: :attendances
    has_many :administrated_events, foreign_key: 'administrator_id', class_name: "Event"
end
