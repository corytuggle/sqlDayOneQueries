-- 1) How many actors are there with the last name 'Wahlberg'?
select last_name
from acto
where last_name like 'Wahlberg';
-- output: 2


-- 2) How many payments were made between $3.99 and $5.99?
select count(amount)
from payment
where amount > 3.99 and amount < 5.99;
-- output: 3214


-- 3) What film does the store have the most of? (search in inventory)
select film_id, count(film_id)
from inventory
group by film_id
order by count desc;
-- output: film_id 200 (Curtain Videotape) with 9


-- 4) How many customers have the last name 'William'?
select last_name, count(last_name)
from customer
where last_name like 'William'
group by last_name;
-- output: empty, 0


-- 5) What store employee (get the id) sold the most rentals?
select staff_id, count(staff_id)
from rental
group by staff_id;
-- output: 1 (Mike) - 8040


-- 6) How many different district names are there?
SELECT COUNT(DISTINCT district) 
FROM address;
-- output: 378

-- 7) What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(actor_id)
from film_actor
group by film_id 
order by count(film_id) desc;
-- output: film_id 508 (Lambs Cincinatti) - count(actor_id) 16


-- 8) From store_id 1, how many customers have a last name ending with 'es'? (use customer table)
select last_name, count(last_name)
from customer
where last_name like '%es'
group by last_name;
-- output: 21


-- 9) How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
select amount, customer_id
from payment 
where customer_id > 380 and customer_id < 430 and amount > 250
group by amount, customer_id;
-- output: empty, 0  (checked between 330 and 430 and one result came back)


-- 10) Within the film table, how many rating categories are there? And what has the most movies total?
select count(distinct title), rating
from film
group by rating;
-- output: 5 ratings, PG-13 has the most with 223