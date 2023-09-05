/* Q1:What are the details of all cars purchased in the year 2022?*/

 select c.car_id,c.make,c.type,c.style,c.cost_$,s.purchase_date
 from cars as c inner join sales as s
 on c.car_id=s.car_id
 where s.purchase_date between '2022-01-01' and '2022-12-31';
 
 /*Q2: What is the total number of cars sold by each salesperson?*/
 
 select sp.salesman_id,sp.name,count(s.sale_id) as noOfCarsSold
 from salespersons as sp inner join sales as s
 on sp.salesman_id=s.salesman_id
 group by sp.salesman_id,sp.name
 order by noOfCarsSold desc ;
 
/*Q3: What is the total revenue generated by each salesperson?*/

select sp.salesman_id,sp.name,sum(c.cost_$) as Revenue
from sales as s inner join cars as c
on s.car_id=c.car_id
inner join salespersons as sp
on sp.salesman_id=s.salesman_id
group by sp.salesman_id, sp.name;

/*Q4: What are the details of the cars sold by each salesperson?*/

select s.salesman_id,sp.name,c.car_id,count(s.car_id) as num_of_cars_sold,c.make,c.type,c.style,sum(c.cost_$) as totalRevenue
from sales as s inner join cars as c
on s.car_id=c.car_id
inner join salespersons as sp
on sp.salesman_id=s.salesman_id
group by s.salesman_id,s.car_id;

/*Q5: What is the total revenue generated by each car type?*/

select s.car_id, c.type,sum(c.cost_$) TotalRevenue
from cars as c inner join sales as s
on s.car_id=c.car_id
group by s.car_id,c.type
order by TotalRevenue desc;

/*Q6: What are the details of the cars sold in the year 2021 by salesperson 'Emily Wong'?*/

select s.salesman_id,sp.name,c.car_id,count(s.car_id) as num_of_cars_sold,c.make,c.type,c.style,
sum(c.cost_$) as totalRevenue
from sales as s inner join cars as c
on s.car_id=c.car_id
inner join salespersons as sp
on sp.salesman_id=s.salesman_id
where sp.name='Emily Wong' and Year(purchase_date)=2021
group by s.salesman_id,s.car_id;

/*Q7: What is the total revenue generated by the sales of hatchback cars?*/

select s.car_id,c.style,sum(cost_$) as RevenueGenerated
from sales as s inner join cars as c
on s.car_id=c.car_id
where c.style= 'Hatchback'
Group by s.car_id;

/*Q8: What is the total revenue generated by the sales of SUV cars in the year 2022?*/

select style,sum(c.cost_$) as RevenueGenerated
from sales as s inner join cars as c
on s.car_id=c.car_id
where c.style='SUV' and Year(purchase_date)='2022'
Group by c.style;

/*Q9: What is the name and city of the salesperson who sold the most number of cars in the year 2023?*/

select sp.name,sp.city,count(s.car_id) as MaxNumOfCarsSold
from salespersons as sp inner join sales as s
on sp.salesman_id=s.salesman_id
where Year(s.purchase_date)='2023'
Group by sp.city,sp.name
order by MaxNumOfCarsSold desc
limit 1 ;

/*Q10: What is the name and age of the salesperson who generated the highest revenue in the year 2022?*/

select sp.name,sp.age,sum(c.cost_$) as MaximumRevenue
from salespersons as sp inner join sales as s
on sp.salesman_id=s.salesman_id
inner join cars as c
on s.car_id=c.car_id
where Year(s.purchase_date)='2022'
Group by sp.age,sp.name
order by  MaximumRevenue desc
limit 1 ;
