create table if not exists trn.transaction
	(
		transaction_id int set default nextval('trn.seq_transactions')
		,user_id int not null
		,create_date date set default (now())
		,documnet_id int
 		);