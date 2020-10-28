--create table users (
--	id SERIAL PRIMARY KEY,
--	created_at 	TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--	updated_at 	TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--	username 	VARCHAR(30) NOT NULL,
--	bio 		VARCHAR(400),
--	avatar 		VARCHAR(200),
--	phone 		VARCHAR(25),
--	email 		VARCHAR(40),
--	password 	VARCHAR(50),
--	status 		VARCHAR(15),
--	CHECK(COALESCE(phone, email) IS NOT NULL)
--); 

--create table posts (
--	id 			SERIAL PRIMARY KEY,
--	created_at 	TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--	updated_at 	TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--	url 		varchar(200) not NUll,
--	caption 	varchar(240),
--	lat 		real check(lat is null or (lat >= -90 and lat <= 90)),
--	lng 		real check(lat is null or (lat >= -180 and lat <= 180)),
--	user_id 	integer not null references users(id) on delete cascade
--); 

--create table comments (
--	id 			SERIAL PRIMARY KEY,
--	created_at 	TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--	updated_at 	TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--	contents 	varchar(240) not null,
--	user_id 	integer not null references users(id) on delete cascade,
--	post_id 	integer not null references posts(id) on delete cascade 
--); 

--create table likes (
--	id 			SERIAL PRIMARY KEY,
--	created_at 	TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
----	polymorphic association.
--	user_id 	integer not null references users(id) on delete cascade,
--	post_id 	integer references posts(id) on delete cascade,
--	comment_id  integer references comments(id) on delete cascade,
--	check(
----	it turn back first arg that is not null
--		(coalesce((post_id)::boolean::integer, 0))
--		+
--		(coalesce((comment_id)::boolean::integer, 0)) 
--		= 1
--	),
--	unique(user_id,post_id,comment_id)
--); 


--create table photo_tags (
--	id 			SERIAL PRIMARY KEY,
--	created_at 	TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--	updated_at 	TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--	x			real not null,
--	y			real not null,
--	user_id 	integer not null references users(id) on delete cascade,
--	post_id 	integer references posts(id) on delete cascade,
--	unique(user_id,post_id)
--
--); 



--create table caption_tags (
--	id 			SERIAL PRIMARY KEY,
--	created_at 	TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--	user_id 	integer not null references users(id) on delete cascade,
--	post_id 	integer references posts(id) on delete cascade,
--	unique(user_id,post_id)
--); 

--create table hashtags (
--	id 			SERIAL PRIMARY KEY,
--	created_at 	TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--	title 		varchar(20) not null unique
--); 
--


--create table hashtags_posts (
--	id 			SERIAL PRIMARY KEY,
--	hashtag_id  integer not null references hashtags(id) on delete cascade,
--	post_id  	integer not null references posts(id) on delete cascade,
--	unique(hashtag_id,post_id)
--); 


create table followers (
	id 				SERIAL PRIMARY KEY,
	created_at 		TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	leader_id  		integer not null references users(id) on delete cascade,
	follower_id  	integer not null references users(id) on delete cascade,
	unique(leader_id ,follower_id)
); 



















