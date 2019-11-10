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
* En local
  * Boostrap
~~~bash
$ rails server
~~~
La navbar et les éléments bootstrap fonctionnent bien :)
  * Modern-business template
`app/view/layouts/application.html.erb`
~~~html
    <!-- Test component from Modern business template-->
      <a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a>
    <!-- /test_component-->
~~~

* En production
  * simulation en local
  
