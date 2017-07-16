create view cfg.users
	as
	select userid, username, password, is_active from cfg.customers