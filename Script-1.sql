--create table products (
--	id Serial primary key,
--	name varchar(40),
--	department varchar(40),
--	price integer,
--	weight integer
--);

--insert
--	into
--	products(name, department, price, weight)
--values ('shirt', 'sl', 20, 1);

--insert
--	into
--	products(name, department, weight)
--values ('pants', 'clothes',  3);

--delete from products where id = 9;

--update products set price = 9999 where price is null;

--ALTER TABLE products 
--ALTER column price 
--SET NOT null;

--ALTER TABLE products 
--ALTER column price 
--SET DEFAULT 999;

--ALTER TABLE products ADD UNIQUE (name);

--alter table public.products drop constraint products_name_department_key;


--alter table products add unique (name,department);


--ALTER TABLE products ADD CHECK (price > 0)

--create table orders (
--	id 				serial primary key,
--	name 			varchar(40) not null,
--	created_at 		timestamp not null,
--	est_delivary 	timestamp not null,
--	check (created_at < est_delivary)
--)

--insert
--	into
--	orders (name, created_at , est_delivary)
--values ('shirt', '2000-nov-20 01:00am', '2000-nov-19 01:00am');


--select
--	coalesce(null, 5)
--select
--	coalesce(10, 5)























