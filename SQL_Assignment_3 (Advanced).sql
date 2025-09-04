#1)Write a query to calculate the total records in both tables?
set @count_tb1=(select count(*) from tata_tb1); 
set @count_tb2=(select count(*) from tata_tb2);
select @count_tb1+@count_tb2;

#2)Write a query to calculate the total unique count of customers?
select count(distinct CustomerName) from tata_tb1;

#3)Write a query to fetch the oldest order date and latest order date?
select max(OrderDate) Latest_OrderDate ,min(OrderDate) Oldest_OrderDate from tata_tb1;

#4)Write query to get years in table?
select distinct year(OrderDate) Yr from tata_tb1;

#5)Write a query to get the no. of regions and display the region names?
select count(distinct Region) No_Of_Regions from tata_tb1;
select distinct Region from tata_tb1;

#6)Write a query to get the no. of countries and display the country names?
select count(distinct Country) No_Of_Country from tata_tb1;
select distinct Country from tata_tb1;

#7)Write a query to get the no. of states and display the state names?
select count(distinct State) No_Of_State from tata_tb1;
select distinct State from tata_tb1;

#8)Write a query to get the no. of cities and display the city names?
select count(distinct City) No_Of_City from tata_tb1;
select distinct City from tata_tb1;

#9)Write a query to calculate the total count of customers?
select count(distinct CustomerName) Count_CustomerName from tata_tb1 ;

#10)Write a query to calculate the total count of products?
select count(distinct ProductName) from tata_tb2 ;

#11)Write a query to calculate total sales, total profit and total order quantity?
select sum(Sales) TotalSales,sum(Profit) TotalProfit, sum(OrderQuantity) Total_OrderQuantity from tata_tb2;

#12)Write a query to calculate the total sales amount for each category. Display the category, total sales, 
# and total order qty and order by total sales from highest to lowest?
select Category,sum(sales) Total_Sales,sum(OrderQuantity) Total_OrderQuantity from tata_tb2
group by Category
order by sum(sales) desc;

#13)Write a query to calculate the total profit amount for each category. 
#Display the category, total profit, and total order qty and order by total profit from highest to lowest?
select Category,sum(profit) Total_Profit,sum(OrderQuantity) Total_OrderQuantity from tata_tb2
group by category
order by sum(profit) desc;

#14)Write a query to fetch the subcategories where total sales are greater than 100000?
select Subcategory,sum(sales) Total_Sales from tata_tb2
group by Subcategory having sum(sales)>100000
order by sum(sales) ;

#15)Write a query to fetch the products where total profit is greater than 1000?
select ProductName,sum(Profit) Total_Profit from tata_tb2
group by ProductName having sum(Profit)>1000
order by sum(Profit) ;

#16)Write a query to get the total sales and total profit for Office Supplies category?
select sum(sales) Total_Sales, sum(profit) Total_Profit from tata_tb2
where category='Office Supplies';

#17)Write a query to get the total sales and total profit for Furniture category and the Tables and Bookcases sub-categories ?
select sum(sales) Total_Sales, sum(profit) Total_Profit from tata_tb2
where category='Furniture' and subcategory in ('Tables','Bookcases');

#18)Write a query to get the total sales and total profit for Technology category and the Accessories, Copiers, Phones sub-categories ?
select sum(sales) Total_Sales, sum(profit) Total_Profit from tata_tb2
where category='Technology' and subcategory in ('Accessories', 'Copiers', 'Phones');

#19)Write a query to get total sales and total profit by Region, Segment?
select Region, Segment,sum(sales) Total_Sales, sum(profit) Total_Profit 
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
group by Region, Segment
order by sum(sales) desc, sum(profit) desc;

#20)Write a query to get total sales and total profit by Country, State and city?
select Country, State,City,sum(sales) Total_Sales, sum(profit) Total_Profit 
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
group by Country, State,City
order by Country,State,City;

#21)Write a query to get total sales and total orderqty by CustomerName sort it by totalsales from highest to lowest?
select CustomerName,sum(sales) Total_Sales,sum(OrderQuantity) Total_OrderQuantity
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
group by CustomerName
order by sum(sales) desc;

#22)Identify the top 5 products with the highest sales (by sales amount). Show the product name, total sales, and total qty?
select ProductName,sum(Sales) Total_Sales,sum(OrderQuantity) Total_Quantity 
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
group by ProductName
order by sum(Sales) desc
limit 5;

#23)Write a query to get total sales by City having sales greater than 2000?
select City,sum(sales) Total_Sales
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
group by City having sum(sales)>2000
order by sum(sales) ;

#24)Write a query to get total sales by CustomerName having sales greater than 3000?
select CustomerName,sum(sales) Total_Sales
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
group by CustomerName having sum(sales)>3000
order by sum(sales) ;

#25)Write a query to get total sales and total profit by shipmode?
select Shipmode,sum(sales) Total_Sales,sum(profit) Total_Profit
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
group by Shipmode
order by sum(sales) ;

#26)Write a query to get total sales for North and central region?
select sum(Sales) Total_Sales
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
where Region in ('North','Central');

#27)Write a query to get total sales and total profit for Italy and Spain countries?
select sum(Sales) Total_Sales, sum(Profit) Total_Profit
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
where Country in ('Italy','Spain');

#28)Write a query to get the total sales and total profit for each year?
select year(orderDate) Yr,sum(Sales) Total_Sales,sum(profit) Total_Profit
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
group by Yr;

#29)Find the top 10 customers who spent the most across all transactions. 
#Display the customer name, total amount spent, and number of orders placed?
select CustomerName,sum(Sales) Total_AmountSpent, sum(OrderQuantity) Total_OrderQuantity
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
group by CustomerName
order by sum(Sales) desc
limit 10;

#30)Write a query to find which products are most preferred by customers based on the total sales. 
#Display customer name, favorite product9 (top 3 products per each customer), and total sales on that product?
with 
cte1 as
		(select CustomerName,ProductName,sum(sales)TotalSales 
		from tata_tb1 a join tata_tb2 b
		on a.OrderID=b.OrderID
		group by CustomerName,ProductName),
cte2 as (select *,rank() over(partition by CustomerName order by TotalSales desc)rnk from cte1)
select CustomerName,ProductName,TotalSales  from cte2 where rnk<4;

#31)Write a query to get 7th rank customer name based on total sales? Display customer name, sales amount and rank.
with cte1 as (select CustomerName, sum(sales) Total_Sales 
			  from tata_tb1 a join tata_tb2 b
			   on a.OrderID=b.OrderID
			  group by CustomerName),
	cte2 as (select *,rank() over(order by Total_Sales desc) rnk from cte1)
    select * from cte2 where rnk=7;
    
#32)Write query to get total sales and total profit between year 2011 and 2013?
select sum(sales) Total_Sales ,sum(profit) Total_Profit
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
where year(orderdate) between 2011 and 2013;

#33)Write a query to get total sales, total profit and total order qty by country, state, category and sub-category?
select Country,State,Category,SubCategory,sum(sales) Total_Sales ,sum(profit) Total_Profit,sum(orderquantity) Total_OrderQuantity
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
group by Country,State,Category,SubCategory
order by Country,State,Category,SubCategory;

#34)Write stored procedure to get top 10 customers based on total sales?
delimiter $$
create procedure Top10Customers_Sales ()
begin
select CustomerName, sum(sales) Total_Sales from
tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
group by CustomerName
order by sum(sales) desc
limit 10;
end;
$$

call Top10Customers_Sales ()

#35)Create a virtual table (view) by using OrderID, OrderDate, CustomerName, Region, country, sales, profit and order qty?
create view Cust_Details
as(
select a.OrderID, a.OrderDate, a.CustomerName, a.Region, a.country, b.sales, b.profit, b.orderQuantity 
from tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID);

select * from Cust_Details;

#36)Create a stored procedure to get region sales?
delimiter $$
create procedure RegionSales()
begin
select Region, sum(sales) Total_Sales from 
tata_tb1 a join tata_tb2 b
on a.OrderID=b.OrderID
group by Region
order by sum(sales) desc;
end;
$$

call RegionSales()



