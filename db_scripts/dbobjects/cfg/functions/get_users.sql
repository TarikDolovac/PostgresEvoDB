#Creating function which return all users

Create or replace function cfg.get_users () 
returns table (ID int, name text)
as $$
	Select userID, username from cfg.users 
	$$
language SQL;