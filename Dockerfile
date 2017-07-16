FROM postgres
ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB docker


#Directory paths for including new scripts in docker file
#------------------------------------------------------------------------------------
#db_scripts/dbobjects/${NEED_SCHEMA_NAME}/funtions/
#db_scripts/dbobjects/${NEED_SCHEMA_NAME}/sequences/
#db_scripts/dbobjects/${NEED_SCHEMA_NAME}/tables/
#db_scripts/dbobjects/${NEED_SCHEMA_NAME}/triggers/
#db_scripts/dbobjects/${NEED_SCHEMA_NAME}/views/
#db_scripts/schemas

#data/static_data
#data/data_for_testing


#------------------------------------------------------------------------------------
#IMPORTANT after adding /docker-entrypoint-initdb.d/ part of path you have to set order of script execution by number
#example
#/docker-entrypoint-initdb.d/1/*.sql
#/docker-entrypoint-initdb.d/1.1/*.sql



#Incuding *.sql scripts
#------------------------------------------------------------------------------------

#Creating schemas
ADD db_scripts/schemas/schema_cfg.sql /docker-entrypoint-initdb.d/
ADD db_scripts/schemas/schema_trn.sql /docker-entrypoint-initdb.d/


#Creating DB objects in cfg schema
ADD db_scripts/dbobjects/cfg/tables/users1.sql /docker-entrypoint-initdb.d/a/users1.sql
ADD db_scripts/dbobjects/cfg/functions/users2_get.sql /docker-entrypoint-initdb.d/1.1/users2_get.sql
ADD db_scripts/dbobjects/cfg/sequences/seq_users.sql /docker-entrypoint-initdb.d/
ADD db_scripts/dbobjects/cfg/tables/users3_customers.sql /docker-entrypoint-initdb.d/1.2/users3_customers.sql
ADD db_scripts/dbobjects/cfg/views/w_users.sql /docker-entrypoint-initdb.d/1.2/w_users.sql

#Creating DB objects in trn schema
#------------------------------------------------------------------------------------
