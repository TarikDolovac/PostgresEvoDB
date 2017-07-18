create table if not exists trn.transaction
	(
		transaction_id int default nextval('trn.seq_transactions')
		,user_id int not null
		,create_date date default (now())
		,documnet_id int
 		);