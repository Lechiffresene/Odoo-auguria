# Utilisez l'image de base officielle d'Odoo 16
FROM odoo:16

# Copiez votre configuration personnalisée d'Odoo dans l'image
COPY ./odoo.conf /etc/odoo/odoo.conf

# Copiez votre fichier entrypoint.sh dans l'image
COPY ./entrypoint.sh /entrypoint.sh

# Définissez l'utilisateur root pour pouvoir effectuer des modifications
USER root

# Installez les dépendances système supplémentaires si nécessaire
RUN apt-get update && apt-get install -y <dependencies>

# Changez l'utilisateur à nouveau à l'utilisateur Odoo par défaut
USER odoo

# Exposez le port d'Odoo si nécessaire
EXPOSE 8069

# Définissez l'entrée de démarrage du conteneur sur entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]