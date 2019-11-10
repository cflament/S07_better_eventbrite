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