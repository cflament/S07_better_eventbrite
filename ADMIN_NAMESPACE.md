# Ajout de fonctionnalités spécifiques via le namespace `admin`

## ROUTES

`config/routes.rb`
~~~ruby
  namespace :admin do
    root 'dashboard#index' # application_root/admin will link to dashboard controller - index method
    resources :users # application_root/admin/user* will link to user rest methods
    resources :events # same for events
  end
~~~

## CONTROLLERS

### Base controller
~~~bash
$ rails generate admin/base
~~~

Spécialisation du `ApplicationController` adapté aux éléments du namespace `admin`

~~~ruby
  class Admin::BaseController < ApplicationController
  layout 'admin' # using admin layout for all admin pages
end
~~~

### Dashboard controller
~~~bash
$ rails generate controller admin/dashboard
~~~

Gère ce qui concerne le tableau de bord administrateur

~~~ruby
class Admin::DashboardController < Admin::BaseController
  def index # affichage d'une page de bienvenue avec infos généralistes pour l'admin
  end
end
~~~

### Users controller
~~~bash
$ rails generate admin/users
~~~

Affichage de tout ce qui concerne les users pour un admin

~~~ruby
class Admin::UsersController < Admin::BaseController
  
  def index # affichage des users
    @users = User.all.sort # dans l'ordre d'id ça fait plus joli
  end
end
~~~

## VIEWS

### Dashboard

### Users

### Events