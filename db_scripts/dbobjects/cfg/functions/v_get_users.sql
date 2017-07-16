Create or replace function cfg.get_users () 
returns table (ID int, name text, active bit)
as $$
	Select userID, username, is_active from cfg.users 
	$$
language SQL;