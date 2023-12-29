create database music;

use music;




# L1,a Who is the senior most employee based on job title ?

select * from employee
order by levels desc
limit 1;


#  2 Which Countries have the most invoices?


select billing_Country as country, count(invoice_id) as Invoice_total   --  sum(invoice_id)-- previous attempt
from invoice
group by country
order by invoice desc;


select count(*) as c ,billing_Country, count(invoice_id) as Invoice_total   --  sum(invoice_id)-- previous attempt
from invoice
group by billing_country
order by c desc;



# 3 What are top 3 values of total invoice


select total as Invoice_total   --  
from invoice
order by total desc
limit 3;




# 4  Which city has best customer ? We would like to throw a promotional music festival in the city we made the most money. Write a query 
    #  that returns one city that has the highest sum of invoice totals. Return both the city name ane sum of all invoice totals
    
    select billing_city as city, sum(total) as total_invoice from invoice
    group by city
    order by total_invoice desc;
    
    
    
  -- 00000  
# 5. Who is the best customer? The c. who has spent the most money will be declared 
     # the best c. Write a query that returns the person who spent the most money.



select customer.customer_id, customer.first_name, customer.last_name from customer
inner join invoice on customer.customer_id = invoice.customer_id
order by sum(total) desc
limit 1;



select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1;                         --     --   error   ans = R madhav





-- moderate 
-- 1. Write query to return the email, first name, last name and genre of all rock music listeners. 
-- return your list ordered alphabetically by email starting with A 

select distinct email,first_name, last_name     -- customer
from customer 
join invoice on customer.customer_id = invoice_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in (                                   

     select track_id from track
     join genre on track.genre_id = genre.genre_id
     where genre.name like "Rock"
     )
     
order by email;





-- 00000 album upload
-- 2. Let,s invite the artist who have written the most rock music in our data set. 
-- Write query that returns the artst name and total track count of the top 10 rock bands




select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs    -- album unavailable
from tracks

join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like "Rock"
group by artist.artist_id 
order by number_of_songs desc
limit 10;





--  3, Return all the track names that have a song length longer than the average song length.
   -- return the name and milisecond for each track order by the song with the longest song 
   -- listed first 


select name, milliseconds 
from track
where milliseconds > (
     select  avg(milliseconds )
as avg_track_length from track)
order by milliseconds desc;




-- second method

select  avg(milliseconds )
as avg_track_length from track;

select name, milliseconds 
from track
where milliseconds > '251177.7431'
order by milliseconds desc;



