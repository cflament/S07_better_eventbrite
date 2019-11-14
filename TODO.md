# TO-DO LIST

## Rattrapage du jeudi

### Active Storage

* ~~brancher active storage en local~~ DONE
* mettre à jour le model ~~User~~ **EVENT**
* mettre à jour le controller ~~User~~ **EVENT**
* mettre à jour les routes
* intégrer le formulaire d'ajout

### Assets Pipeline
 * À peu près fait par nous deux je crois

## Rattrapge du vendredi - namespace admin

### Namespace, controller et view
* créer la route correspondant au namespace admin
* créer le controller admin, méthode index
* créer le tableau de bord administrateur
* gérer la restriction d'accès

### Gestion des utilisateurs
* CRUD complet sur le modèle User via le tableau de bord admin

### À compléter


## Divers

* ~~ajouter les champs Prénom... à la création du User~~ DONE
  * nécessite de pouvoir ajouter des champs CUSTOM au formulaire DEVISE
    * on change les paramètres autorisés par Devise cf [la doc](https://github.com/plataformatec/devise#strong-parameters) et [ce guide](http://www.peoplecancode.com/tutorials/adding-custom-fields-to-devise)

* ajouter un visuel sur les évènements déjà rejoints dans la view `events/index`