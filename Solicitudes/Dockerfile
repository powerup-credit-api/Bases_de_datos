FROM mysql:8.0

# Configurar el puerto de forma MÁS AGGRESIVA
ENV MYSQL_TCP_PORT=3307

# Copiar script de inicialización
COPY ./init.sql /docker-entrypoint-initdb.d/

# Exponer el puerto
EXPOSE 3307

# SOBRESCRIBIR el entrypoint para forzar el puerto
CMD ["mysqld", "--port=3307", "--socket=/var/run/mysqld/mysqld.sock"]