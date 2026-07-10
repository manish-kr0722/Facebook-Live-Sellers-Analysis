create database FacebookLive
use FacebookLive
select * from Live
alter table Live drop  column Column1, Column2, Column3, Column4

-- Checking Total records in the table: 
select count(*) as Total_Records from Live 

-- Checking for Null Values if there is no reaction on post 
select * from Live where num_reactions IS NULL

-- Check for distinct Status Type
select distinct status_type from Live

-- Count the number of post by each status type
select status_type, count (*) as No_of_Post from Live group by status_type

-- Top 10 most share Post
select top 10 * from Live order by num_shares desc

-- Top 10 highest comments on Post
select top 10 * from Live order by num_comments desc

-- Total engagement on the post
select *, (num_reactions+num_comments+num_shares) as Total_Engagement from Live

-- Avg Enagagement on the post by status type
select status_type, avg(num_comments+num_shares+num_reactions)  
as avg_engagement from Live group by status_type

-- which content has performed best

select status_type,
sum(num_reactions+num_comments+num_shares) as Total_Engagement 
from Live group by status_type order by  Total_Engagement desc

--  Which post type has most shares

select top 1 status_type, sum(num_shares) as no_of_shares from Live 
group by status_type 
order by sum(num_shares) desc 

-- Which post type has most comments

select top 1 status_type, sum(num_comments) as no_of_comments from Live 
group by status_type 
order by sum(num_comments) desc

-- Which post type has most reaction
select top 1 status_type, sum(num_reactions) as no_of_reaction from Live 
group by status_type 
order by sum(num_reactions) desc

-- Which post got most reaction, comments and share

SELECT TOP 1 status_id, status_type, num_reactions 
FROM Live 
ORDER BY num_reactions DESC

SELECT TOP 1 status_id, status_type, num_comments 
FROM Live 
ORDER BY num_comments DESC

SELECT TOP 1 status_id, status_type, num_shares 
FROM Live 
ORDER BY num_shares DESC