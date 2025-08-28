# Imagen de MySQL
FROM mysql:8.0

# Definir variables de entorno
ENV MYSQL_DATABASE=solicitudes \
    MYSQL_USER=myuser \
    MYSQL_PASSWORD=mypassword \
    MYSQL_ROOT_PASSWORD=rootpassword


# Copiar script de inicialización
COPY ./init.sql /docker-entrypoint-initdb.d/

# Exponer el puerto de MySQL
EXPOSE 3306
