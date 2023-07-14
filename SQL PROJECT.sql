use project;
show tables;
select * from salesman;
insert into salesman(salesman_id,name, city, comission)
values
(5001,"James Hoog",'New York', 0.15);
insert into salesman(salesman_id,name, city, comission)
values
(5002,"Nail Knite",'Paris', 0.13);
insert into salesman(salesman_id,name, city, comission)
values
(5005,"Pit Alex",'London', 0.11);
insert into salesman(salesman_id,name, city, comission)
values
(5006,"Mc Lyon",'Paris', 0.14);
insert into salesman(salesman_id,name, city, comission)
values
(5003,"Lauson Hen",'Rome', 0.12);
insert into salesman(salesman_id,name, city, comission)
values
(5007,"Paul Adem",'Rome', 0.13);


select *  from customer;

insert into customer(customer_id, customer_name, city, grade,salesman_id)
values
(3002, "Nick Rimando", 'New York', 100, 5001);

insert into customer(customer_id, customer_name, city, grade,salesman_id)
values
(3005, "Graham Zushis", 'California', 200, 5002);

insert into customer(customer_id, customer_name, city, grade,salesman_id)
values
(3001, "Brad Gurans", 'London', 100, 5001);

insert into customer(customer_id, customer_name, city, grade,salesman_id)
values
(3004, "Fabian Johns", 'Paris', 300, 5006);

insert into customer(customer_id, customer_name, city, grade,salesman_id)
values
(3007, "Brad Davis", 'New York', 200, 5001);

insert into customer(customer_id, customer_name, city, grade,salesman_id)
values
(3009, "Geoff Camero", 'Berlin', 100, 5003);

insert into customer(customer_id, customer_name, city, grade,salesman_id)
values
(3008, "Julie Green", 'London', 300, 5002);

insert into customer(customer_id, customer_name, city, grade,salesman_id)
values
(3003, "Jary Altidor", 'New York', 200, 5007);




select * from orders;
insert into orders(order_no, purchase_amt, order_date,customer_id,salesman_id)
values
(70001,150.5, '2016-10-05',3005,5002);

insert into orders(order_no, purchase_amt, order_date,customer_id,salesman_id)
values
(70009,270.65,'2016-09-10',3001,5003);

insert into orders(order_no, purchase_amt, order_date,customer_id,salesman_id)
values
(70002, 65.26,'2016-10-05',3002,5001);

insert into orders(order_no, purchase_amt, order_date,customer_id,salesman_id)
values
(70004,110.5,'2016-08-17',3009,5003);

insert into orders(order_no, purchase_amt, order_date,customer_id,salesman_id)
values
(70007,948.5,'2016-09-10',3005,5002);

insert into orders(order_no, purchase_amt, order_date,customer_id,salesman_id)
values
(70005,2400.6,'2016-07-27',3007,5001);

insert into orders(order_no, purchase_amt, order_date,customer_id,salesman_id)
values
(70008,57.60,'2016-09-10',3002,5001);

insert into orders(order_no, purchase_amt, order_date,customer_id,salesman_id)
values
(700010,1983.43,'2016-10-10',3004,5006);

insert into orders(order_no, purchase_amt, order_date,customer_id,salesman_id)
values
(70003,2480.4,'2016-10-10',3009,5006);

insert into orders(order_no, purchase_amt, order_date,customer_id,salesman_id)
values
(70012,250.45,'2016-06-27',3008,5002);

insert into orders(order_no, purchase_amt, order_date,customer_id,salesman_id)
values
(70011,75.29,'2016-08-17',3003,5007); 


/*
Display names and comission of all the salesman
*/
select name, comission
from salesman;

/*
Retrieve salesman id of all salesmen from the orders table without any repeats
*/
select distinct salesman_id
from orders;

/*
Display names and city of salesman who belongs to the city of paris.
*/

select name,city
from salesman
where city='Paris'

/*
Display all the infromation for those customers with a grade of 200
*/

select *
from customer
where grade = 200;

/*
Display the order no, order date, and the purchase amount for orders which will be delivered by the
salesman with ID 5001
*/

select order_no, order_date, purchase_amt
from orders
where salesman_id = 5001;

/*
find the salesman whose gets the comission within the range of 0.12 and 0.14
*/

select * 
from salesman
where comission between 0.10 and 0.12;

/*
Display cutomers with the info whose names are ending with letter 'n'
*/
select *
from customer
where customer_name like '%n';

/*
Find those salesman with the information whose name containing the 1st character is 'N' and 4th is 'I'
and rest be any thing.
*/

select * 
from salesman 
where name like'n_i%';

/*
Find the total purchase amount of all orders
*/

select sum(purchase_amt)
from orders;

/*
Find the highest hrade for each of the cities of the customers
*/

select city,max(grade)
from customer
group by city;

/*
Find the highest purchase amount ordered by the each customer with their Id and highest 
purchase amount
*/

select customer_id, max(purchase_amt)
from orders
group by customer_id;
/*
Find the highest purchase amount ordered by each customer on a particular date with their ID, order date
and highest purchase amount
*/

select customer_id,order_date,max(purchase_amt)
from orders
group by customer_id,order_date;

/*
Find the highest purchase amount on a date 2016-08-17
*/
select salesman_id,max(purchase_amt)
from orders
where order_date='2016-08-17'
group by salesman_id;

/*
Find the name and city of those customers and salesmen who lives in the same city.\ Inner join
*/

select c.customer_name, s.name, s.city
from customer c
join salesman s on c.city=s.city;


/*
find the names of all customers along with the salesman who works for them\ Left join
*/

select c.customer_name, s.name
from customer c 
left join salesman s on c.customer_id=s.salesman_id;

/*
Display all the orders issued by the salesman 'Paul'
*/

select * 
from orders
where salesman_id=
(select salesman_id
from salesman
where  name ='Paul Adem');

-- find all the ordered attributed salesman in 'paris'

select *
from orders
where salesman_id in
(select salesman_id 
from salesman
where city = 'Paris');

/*
Display only those customers whose grade are higher than every customer in New York
*/
select * 
from customer
where grade > all
(select grade
from customer
where city = 'New York');




  




