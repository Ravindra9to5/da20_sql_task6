--1.Creating view with the help of join and in that join used where,group by,
--having and order by clause with the following table.

select * from product;

select * from customer;

select * from sales;

---------------------------------------------------------------------------
--SOLUTION-1(creating view for product having ship mode is having first class.)

create view first_class_product_dtls as 
select  p.product_id,p.product_name,s.ship_mode
from    product p
inner join sales s
on      p.product_id = s.product_id
where   s.qty > 10
group by   p.product_id,p.product_name,s.ship_mode
having     s.ship_mode = 'First Class' 
order by   p.product_name asc; 

--select statement for first_class_product_dtls view.
select * from first_class_product_dtls ;

------------------------------------------------------------------

--SOLUTION-2(creating view customer is in new york state and segment is corporate. )

create view new_york_corporate_segment as
select      c.cust_id,c.customer_name,c.segment,s.ship_mode
from        customer c
inner join  sales    s
on          c.cust_id = s.cust_id
where       c.state = 'New York'
group by    c.cust_id,c.customer_name,c.segment,s.ship_mode
having      c.segment='Corporate'
order by    c.customer_name asc;

--select statement for new_york_corporate_segment view.
select * from new_york_corporate_segment ;

-------------------------------------------------------------------

--SOLUTION-3(creating view for highest profit earing product name having discount greter than zero and
--sum of profit also greter than zero)

Create view Highest_profit_earn_product as
select     product_name,p.category,round(sum(s.profit)) 
from        sales s
inner join  product p 
on          s.product_id=p.product_id
where       s.discount > 0  
group by    p.category,product_name
having      sum(s.profit) > 0
order by    sum(s.profit) desc;

--select statement for new_york_corporate_segment view.
select * from Highest_profit_earn_product ;

---------------------END TASK-3--------------------------------------





