class Event < ApplicationRecord
    has_many :attendances
    has_many :users, through: :attendances 
    belongs_to :administrator, class_name: 'User'
    
    #custom validations
    validate :start_date_cannot_be_in_the_past, :duration_is_a_multiple_of_five

    #attribute validations
    validates :start_date, presence: { message: "Date de début manquante"}
    validates :duration, 
        presence: { message: "Durée de l'événement non rensignée"}, 
        numericality: { only_integer: true, greater_than: 0, message: "La durée de l'événement doit être un entier positif"}
    validates :title, 
        presence: { message: "Intitulé de l'événement non rensigné"}, 
        length: { minimum: 5, maximum: 140, message: "L'intitulé de l'événement doit faire entre 5 et 140 caractères" }
    validates :description, 
        presence: { message: "Une description de min 20 caractères est requise" },
        length: { minimum: 20, maximum: 1000, message: "La description de l'événement doit faire entre 20 et 1000 caractères" }
    validates :price, 
        numericality: { only_integer: true, greater_than: 1, less_than: 1000, allow_nil: true, message: "Le prix doit être entre 1€ et 1000 €" }
    validates :location, presence: { message: "Lieu de l'événement non renseigné"} 


    def display_price
      if price
        "Prix de l'évènement : " + self.price.to_s + ' €'
      else
        "Cet évènement est gratuit, youpi !"
      end
    end

    private

    def start_date_cannot_be_in_the_past
        if start_date.present? && start_date < DateTime.now
            errors.add(:start_date, "La date de début de l'événement ne doit pas être passée")
        end
    end

    def duration_is_a_multiple_of_five
        if duration.present? && duration % 5 != 0
            errors.add(:duration, "Entrer une durée qui soit un mutiple de 5 minutes")
        end 
    end 
end
