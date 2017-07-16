#creating table in cfg schema
#table will contain all users for loging on system

create table cfg.users
	(
		userid int
		,username varchar (55)
		,password varchar (15)
		,createdate date
		);

alter table cfg.users add column is_active bit;

alter table cfg.users alter column userid set default nextval('cfg.seq_users');