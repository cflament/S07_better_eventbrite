# Ajout de l'active Storage

## Installation

~~~bash
$ rails active_storage:install
# Copied migration 20191109150713_create_active_storage_tables.active_storage.rb from active_storage
~~~

1 fichier ajouté : `2019moisjourheureminute_create_active_storage_tables.active_storage.rb`

~~~bash
$ rails db:migrate
# == 20191109150713 CreateActiveStorageTables: migrating ========================
# -- create_table(:active_storage_blobs)
# -- create_table(:active_storage_attachments)
# == 20191109150713 CreateActiveStorageTables: migrated (0.1325s) ===============
~~~

## Modification du modèle **User**

Ajout de la ligne `has_one_attached :profile_picture` dans le fichier `app/models/user.rb`

## Modification du controller **ProfilePictures**

* Ajout d'un callback set_user
~~~ruby
class ProfilePicturesController < ApplicationController
  before_action :set_user, only: [:create]
# ...
  private
  def set_user
    @user = User.find(params[:user_id]) # user_id parce que nested route, voir paragraphe suivant
  end
end
~~~

* Ajout de la méthode `create`
~~~ruby
class ProfilePicturesController < ApplicationController
# ...
  def create
    if @user.profile_picture.attach(params[:profile_picture]) # voir la modification de USER_show pour le :profile_picture
      flash[:success] = "C'est tellement beeeaaauuuu..."
    else
      flash[:danger] = "Tiens, ça n'a pas marché... Essaie encore ?"
    end
    redirect_to(user_path(@user))
  end
# ...
end
~~~

## Ajout de la route - RESTful, nested
* Dans le ficher `config/routes.rb`
~~~ruby
Rails.application.routes.draw do
# ...
  resources :users, only: [:show, :edit, :update] do
    resources :profile_pictures, only: [:create]
  end
#...
end
~~~

* Ce qui donne
~~~bash
$ rails routes grep | profile
# ###     PATH     ###  VERB   ###            URI Pattern            ###  ------------- #  CONTROLLER#ACTION  #
# user_profile_pictures POST   /users/:user_id/profile_pictures(.:format) ------------- profile_pictures#create
~~~

## Modification de la view User_show
* Affichage de la photo de profil actuelle si elle existe :

~~~erb
<h3>Photo de profil actuelel</h3>
<% if @user.profile_picture.attached? %>
  <%= image_tag @user.profile_picture, alt: 'profile_picture' %>
<%else%>
  <p>=== Il n'y a pas encore de photo de profil liée à cet utilisateurice ===</p>
<%end%>
~~~

* Formulaire d'ajout de la photo de profil :
~~~erb
<%= form_tag user_profile_pictures_path(@user),multipart: true  do %> <--! ne pas oublier ce fichu multipart>
  <%= file_field_tag :profile_picture %>
  <%= submit_tag "Téléverser la photo de profil" %>
<% end %>
~~~

## Reste à faire 
* Héroku
  * push la version actuelle
  * db:migrate:status puis +/- db:migrate ?
  * test en production

* Pour la photo de profil
  * ~~placer correctement l'affichage de la photo de profil (et contraindre sa taille !)~~ DONE
  * ~~placer correctement les options d'ajout et de modification de la photo de profil~~ DONE
  * ~~ajouter la possibilité de changer de photo via l'édition du profil~~ DONE
  * ~~modifier le seed pour ajouter aléatoirement une photo à chaque user~~ DONE
    * a nécessité un changement de configuration pour Active Storage
      * voir [Rails GitHub issue 1](https://github.com/rails/rails/issues/33500)
      * voir [Rails GitHub issue 2](https://github.com/rails/rails/issues/34939)
  * mettre en place une photo par défaut
    * pas encore trouvé comment !

* La même pour l'évènement (je viens de voir que ce n'était pas demandé pour l'utilisateur :/) **boulet**
  * en ajoutant une validation 'obligatoire' pour la photo de l'évènement