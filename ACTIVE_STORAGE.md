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

