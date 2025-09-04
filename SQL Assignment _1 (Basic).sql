#1)What is total number of orders placed? 
select count(OrderID) as Total_Orders from ele_store1 ; # 15000

#2)What are the unique channels present and how many are there?
select distinct channel from ele_store1 ; # Store,Online,Reseller,Catalog
select count(distinct channel) Count_UniqueChannel from ele_store1 ; # 4

#3)How many cities are there?
select count(distinct City) City_Count from ele_store1 ; #263

#4)Query the total cities count by Country
select Country, Count(distinct City) Total_City_Count from ele_store1 
group by Country;

#5)How many products are there?
select count(distinct ProductName) Product_Count from ele_store1;  #1638

#6)Query the total sales and total profit?
select sum(Sales) TotalSales,Sum(Profit) TotalProfit from ele_store1;#55391759.78809967	,31587437.287211794

#7)Query the total sales by region and country?
select Region, Country, sum(Sales) TotalSales from ele_store1
group by Region, Country
order by Region,Country;

#8)Query the total order qty by promotion name?
select PromotionName,sum(OrderQty) Total_OrderQty from ele_store1
group by PromotionName
order by sum(OrderQty);

#9)How much the total sales happened in Asia region?
select sum(Sales) Total_Sales from ele_store1 where Region='Asia';#12412345.056500021

#10)How much profit got in Asia region and India?
select sum(Sales) Total_Sales_India from ele_store1 where Region='Asia' and Country='India';#598404.6095

#11)Query the total order qty by Manufacturer and Product Name?
select Manufacturer,ProductName,sum(OrderQty) Total_OrderQty from ele_store1
group by Manufacturer,ProductName
order by sum(OrderQty) desc;

#12)Query the total order quantity greater than 27 by city?
select City,sum(OrderQty) Total_OrderQty from ele_store1
group by city having sum(OrderQty)>27
order by sum(OrderQty);

#13)How much total sales happened in China and Beijing?
select sum(sales) Total_Sales from ele_store1 where Country ='China' and City='Beijing';#6596953.095500005

#14)How much total sales happened in Asian Holiday Promotion?
select sum(sales) Total_Sales from ele_store1 where PromotionName ='Asian Holiday Promotion';#3615193.9904999994

#15)How much total profit value by Contoso, Ltd Manufacturer?
select sum(profit) Total_Profit from ele_store1 where Manufacturer='Contoso, Ltd';#5670159.660158279

#16)Query the total sales and total order qty by productcategory?
select Productcategory, sum(Sales) Total_Sales,sum(OrderQty) Total_OrderQty from ele_store1
group by Productcategory
order by sum(Sales),sum(OrderQty);

#17)Query the total sales value in between 1057 and 26700 by Region?
select Region, sum(sales) TotalSales from ele_store1
group by Region having sum(sales) between 1057 and 26700
order by sum(sales);

#18)How many orders placed in Pittsfield city?
select count(OrderID) OrdersPlaces from  ele_store1  where city='Pittsfield'; #31

#19)Query the total sales and total profit by region, country and city?
select region,Country,city,sum(sales) Total_Sales,sum(Profit) Total_Profit from ele_store1
group by region,Country,city
order by sum(sales) desc,sum(Profit) desc;

#20)Query the total unit cost and total price by productcategory, productsubcategory and Manufacturer?
select productcategory, productsubcategory,Manufacturer, sum(UnitCost) Total_UnitCost,sum(Price) Total_Price from ele_store1
group by productcategory, productsubcategory,Manufacturer
order by sum(UnitCost) desc,sum(Price) desc;


