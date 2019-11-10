# Ajout du thème moder-business vi l'asset pipeline

## Fichiers nécessaires

* création des dossiers `vendor/assets/stylesheets` et `vendor/assets/javascripts`
* déplacement des fichiers téléchargés dans les bons dossiers
~~~bash
$ tree vendor
vendor
└── assets
    ├── javascripts
    │   ├── bootstrap.bundle.js
    │   └── jquery.js
    └── stylesheets
        ├── bootstrap.css
        └── modern-business.css
~~~

## Configuration de Rails

* Modification du fichier `config/initializers/assets.rb` pour indiquer à Rails où aller chercher les assets
~~~ruby
  Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets")
  Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "javascripts")
~~~

* Modification du manifest `app/assets/stylesheets/application.css`
~~~css
/*
 *= require bootstrap
 *= require modern-business
*/
~~~

* Modification du manifest `app/assets/javascripts/application.js`
~~~js
// Boostrap theme
//= require jquery
//= require bootstrap.bundle
~~~

## Intégration au layout dénéral
~~~html
<head>
...
  <!-- styles using assets pipeline -->
    <link href="vendor/assets/stylesheets/bootstrap.css" rel="stylesheet">
    <link href="vendor/assets/stylesheets/modern-business.css" rel="stylesheet">
  <!-- /styles_assets_pipeline -->
...
</head>
~~~

~~~html
  <!-- Boostrap core JS using assets pipeline -->
    <script src="vendor/javascripts/jquery.js"></script>
    <script src="vendor/javascripts/bootstrap.bundle.js"></script>
  <!-- /bootstrap_js -->
</body>
~~~

## Test

### En local
#### Boostrap
~~~bash
$ rails server
~~~
La navbar et les éléments bootstrap fonctionnent bien :)

#### Modern-business template
* le body a bien pris le padding de 56px défini dans `vendor/assets/stylesheets/modern-template.css`
* ajout d'un composant de test (oui c'est moche sur la page du coup)
`app/view/layouts/application.html.erb`
~~~html
    <!-- Test component from Modern business template-->
      <a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a>
    <!-- /test_component-->
~~~

### En production
#### Simulation en local
~~~bash
$ rails assets:precompile
~~~
Jusque là tout va bien


~~~bash
$ RAILS_ENV=production RAILS_SERVE_STATIC_FILES=true rails s
~~~
Évidemment ça merdouille un peu

* problème de credentials :
  * ai effacé le fichier `config/credentials.yml.enc` puis lancé la commande `$ rails credentials:edit` qui a généré `master.key` et `credentials.yml.enc`
* problème d'envoi de mail de bienvenue
  * ai commenté la ligne d'envoi du mail dans `app/models/user.rb`
* problème de DB non prête

~~~bash
$ RAILS_ENV=production RAILS_SERVE_STATIC_FILES=true rails db:create 
$ RAILS_ENV=production RAILS_SERVE_STATIC_FILES=true rails db:migrate
$ RAILS_ENV=production RAILS_SERVE_STATIC_FILES=true rails db:seed
~~~ 
Et là ça fonctionne :)

#### Sur Heroku
Pas fait du coup