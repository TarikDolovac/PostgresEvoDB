create table if not exist cfg.users
	(
		userid int
		,username varchar (55)
		,password varchar (15)
		,createdate date
		);

/*
alter table cfg.users add column is_active bit;

alter table cfg.users alter column userid set default nextval('cfg.seq_users');

alter table cfg.users alter column is_active set default (1::bit);
*/