FROM postgres
ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB docker

#Addin *.sql scripts
#------------------------------------------------------------------------------------
ADD create_table.sql /docker-entrypoint-initdb.d/