use sakila;

select * from actor;

-- 1a
select first_name, last_name from actor; 





alter table actor
add actor_name varchar (200);

select * from actor;

-- 1b
select upper(concat(first_name, ",", last_name)) as 'actor_name' from actor;  

select (id_number, first_name, last_name) from actor;


select * from actor;

alter table actor
drop column actor_name;

select * from actor;

-- 2a
select actor_id, first_name, last_name from actor
where first_name = "joe"; 

-- 2b
select last_name, first_name from actor
where last_name like "%gen%"; 

-- 2c
select last_name, first_name, actor_id from actor
where last_name like '%li%'
order by last_name; 

select * from country;

-- 2d
select country_id, country from country
where country in ('Afghanistan','Bangladesh', 'China'); 

-- 3a
alter table actor
add description BLOB after last_name; 

select * from actor;

-- 3b
alter table actor
drop column description; 

-- 4a
select last_name, count(last_name) as last_name_counts
from actor
group by last_name; 

-- 4b
select last_name, count(last_name) as last_name_counts
from actor
group by last_name
having last_name_counts >= 2; 



use sakila;

select actor_id, first_name, last_name   from actor
where first_name like "GROUCHO";

-- 4c
UPDATE actor 
SET 
    first_name = 'HARPO'
WHERE
    actor_id = 172; 
    
-- 4d
UPDATE actor 
SET 
    first_name = 'GROUCHO'
WHERE
    first_name = "HARPO"; 

-- 5a    
SHOW CREATE TABLE address; 


select * from staff;
select * from address;

-- 6a
select staff.first_name, staff.last_name, address.address
from address
join staff on
staff.address_id=address.address_id; 

select * from staff;
select * from payment;

-- 6b 
select first_name, last_name, SUM(amount) as 'Total Amount'
from staff
inner join payment on
staff.staff_id= payment.staff_id
and payment_date
like '2005-08%'
group by  first_name, last_name; 

select * from  film_actor;
select * from film;

-- 6c
select film.title, COUNT(film_actor.actor_id)
from film
inner join film_actor on
film_actor.film_id= film.film_id
group by film.title; 

select * from inventory;
select * from film;

-- 6d
select COUNT(film.title), film.film_id from film
inner join inventory on 
film.film_id=inventory.film_id
where title = "Hunchback Impossible"; 

select * from payment;
select * from customer;

-- 6e
select customer.last_name, customer.first_name, SUM(payment.amount)
from customer
inner join payment on 
customer.customer_id=payment.customer_id
group by customer.customer_id 
order by customer.last_name ASC; 

select * from film;
select * from language;

-- 7a
select film.title from film, language 
where film.title like 'K%' or film.title like 'Q%' 
and language.name = "English" 
and film.language_id = language.language_id 
group by film.title; 

select * from film;
select * from film_actor;
select * from actor;

-- 7b
select film.title, actor.first_name, actor.last_name 
from film, film_actor, actor
where film.title = "Alone Trip"
and film.film_id = film_actor.film_id
and film_actor.actor_id = actor.actor_id
group by actor.first_name, actor.last_name; 

select * from country;
select * from customer;
select * from address;
select * from city;

-- 7c
select customer.first_name, customer.last_name, customer.email
from customer, country, address, city
where country = "Canada"
and country.country_id = city.country_id
and city.city_id = address.city_id
and address.address_id = customer.address_id
group by customer.first_name, customer.last_name; 

select * from film_category;
select * from film;
select * from category;

-- 7d
select film.title, category.name
from film, category, film_category
where category.name = "family"
group by film.title; 

select * from rental;
select * from inventory;
select * from film;

-- 7e
select film.title, count(film.title) as total
from film, rental, inventory
where rental.inventory_id=inventory.inventory_id
and inventory.film_id=film.film_id
group by film.title order by total desc; 

select * from store;
select * from rental;
select * from staff;
select * from payment;

-- 7f
select SUM(payment.amount), staff.staff_id, store.store_id
from store, staff, payment, rental
where rental.rental_id = payment.rental_id
and payment.staff_id= staff.staff_id
and staff.store_id=store.store_id
group by store_id; 

select * from store;
select * from city;
select * from country;
select * from address;

-- 7g
select store.store_id, city, country
from store, city, country, address
where address.city_id= city.city_id
and city.country_id= country.country_id
and address.address_id= store.address_id
group by store_id; 

select * from category;
select * from film_category;
select * from inventory;
select * from payment;
select * from rental;
select * from film;

-- 7h my group by must be wrong--------
select category.name, SUM(payment.amount)
from category, film_category, inventory, payment, rental
where rental.inventory_id= inventory.inventory_id
and rental.rental_id= payment.rental_id
and inventory.film_id= film_category.film_id
and film_category.category_id=category.category_id
group by category.name desc
limit 5; 


-- 8a
CREATE TABLE top_five_genres (
	genre varchar (50) not null);

-- 8b ------
select * from top_five_genres;

-- 8c ------
drop table top_five_genres;







 








    

    






 














 








