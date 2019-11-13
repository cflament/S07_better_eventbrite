# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

<<<<<<< HEAD
Rails.application.config.assets.paths << Rails.root.join("lib", "assets", "stylesheets")
Rails.application.config.assets.paths << Rails.root.join("lib", "assets", "javascripts")
=======
# Adding vendor folders paths for assets to precompile
>>>>>>> 2319e426926ecd0f71c8c4caf8f41ea573f8d3fe
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "stylesheets")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "javascripts")
