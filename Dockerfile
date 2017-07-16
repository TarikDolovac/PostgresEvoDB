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
#/docker-entrypoint-initdb.d/${script_name1}.sql
#/docker-entrypoint-initdb.d/${script_name2}.sql



#Incuding *.sql scripts
#------------------------------------------------------------------------------------

#Creating schemas
ADD db_scripts/schemas/schema_cfg.sql /docker-entrypoint-initdb.d/0schema_cfg.sql
ADD db_scripts/schemas/schema_trn.sql /docker-entrypoint-initdb.d/0schema_trn.sql


#Creating DB objects in cfg schema
ADD db_scripts/dbobjects/cfg/tables/users.sql /docker-entrypoint-initdb.d/2users.sql
ADD db_scripts/dbobjects/cfg/functions/users_get.sql /docker-entrypoint-initdb.d/3users_get.sql
ADD db_scripts/dbobjects/cfg/sequences/seq_users.sql /docker-entrypoint-initdb.d/1seq_users.sql
ADD db_scripts/dbobjects/cfg/tables/users_customers.sql /docker-entrypoint-initdb.d/4users_customers.sql
ADD db_scripts/dbobjects/cfg/views/w_users.sql /docker-entrypoint-initdb.d/w_users.sql

#Inserting data for testing
ADD data/data_for_testing/customers_data.sql /docker-entrypoint-initdb.d/5customers.sql

#Creating DB objects in trn schema
#------------------------------------------------------------------------------------
