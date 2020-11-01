
--select id from users order by id desc limit 3
--select username ,caption from posts join users on users.id = posts.user_id where posts.user_id = 200;

--select
--	username,
--	count(*)
--from
--	likes
--join users on
--	users.id = likes.user_id
--group by
--	users.username; 


--show data_directory;

--select  oid, datname from pg_database;

--select * from pg_class;

--create index on users (username);

--create index username_index_with_name_like_this on users (username);

--drop index users_username_idx;

--explain analyze select * from users where username = 'Emil30'

--select pg_size_pretty(pg_relation_size('users'))

--select pg_size_pretty(pg_relation_size('users_username_idx'))


--select relname , relkind from pg_class where relkind = 'i';


--create extension pageinspect;


--select  * from bt_metap('users_username_idx')

--select  * from bt_page_items('users_username_idx', 3)
 
--select  * from bt_page_items('users_username_idx', 1)

--select ctid , * from users where username  = 'Aaliyah.Hintz'

--
--explain analyze
--select
--	username,
--	contents
--from
--	users
--join comments on
--	comments.user_id = users.id
--where
--	username = 'Alyson14'

--select * from pg_stats where tablename = 'users';
--
--create index likes_created_at_idx on likes (created_at)

--explain analyze select * from likes where created_at > '2013-01-01'

--select username , tags.created_at 
--from users join (
--	select user_id ,created_at from caption_tags 
--	union all
--	select user_id , created_at  from photo_tags pt 
--) as tags on tags.user_id = users.id
--where tags.created_at < '2010-01-07'
 
--with tags as (
--	select user_id ,created_at from caption_tags 
--	union all
--	select user_id , created_at  from photo_tags pt 
--)
--select username , tags.created_at 
--from users join tags on tags.user_id = users.id
--where tags.created_at < '2010-01-07'
-- 


--with recursive countdown(val) as (
--	select 8 as val
--	union
--	select val -1 from countdown where val > 1
--)
--select * 
--from 
--countdown;

--with recursive suggestions(leader_id, follower_id, depth) as (
--	select
--		leader_id ,
--		follower_id ,
--		1 as depth
--	from followers 
--	where follower_id = 1
--	union 
--	select followers.leader_id , followers.follower_id, depth + 1
--	from followers 
--	join suggestions on suggestions .leader_id = followers.follower_id 
--	where depth < 3
--)
--select distinct users.id , users.username 
--from suggestions 
--join users on users.id = suggestions.leader_id
--where depth  > 1
--limit 30;


--select username, count(*)
--from users 
--join (
--	select user_id from photo_tags 
--	union all
--	select user_id from caption_tags 
--) as tags on tags.user_id = users.id
--group by username 
--order by count(*) desc;

--create view tags as (
--	select id ,created_at , user_id, post_id,'photo_tag' as type from photo_tags
--	union all
--	select id ,created_at , user_id, post_id,'caption_tag' as type from caption_tags
--)

--select * from tags



--select username, count(*)
--from users 
--join  tags on tags.user_id = users.id
--group by username 
--order by count(*) desc;


--create view recent_posts as (
--	select * from posts order by created_at desc limit 10
--)
--
--select * from recent_posts

--create or replace  view  recent_posts  as (
--	select * from posts order by created_at desc limit 15
--)


--drop view recent_posts;

--create materialized view weekly_likes as (
--select
--	date_trunc('week', coalesce(posts.created_at , comments.created_at)) as week,
--	count(posts.id) as num_posts ,
--	count (comments.id) as num_comments
--from
--	likes
--left join posts on
--	posts.id = likes.post_id
--left join comments on
--	comments.id = likes.comment_id
--group by
--	week
--order by
--	week ) with data;


--select * from weekly_likes

--delete from posts where created_at < '2010-02-01';

--refresh materialized view weekly_likes;

--create table accounts 
--(
--	id serial primary key,
--	name varchar(20) not null,
--	balance integer not null
--)
--
--insert into accounts(name,balance)
--values
--('gia',100),
--('alisyon',100)
--
--select * from accounts;

begin;
select * from accounts;
commit;
rollback;




