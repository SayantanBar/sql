

select * from client_master where name like '_a%';

select * from client_master where city not  like 'B%';

select name,city from client_master where LENGTH(name) = 12 and name like 'I%';

select * from client_master WHERE city = 'Bombay' or city = 'Delhi'; // personal 

select * from client_master WHERE city in ('Bombay','Delhi'); // Sir

select * from client_master WHERE balance_due > 10000;

SELECT * from sales_order where Order_date like '___JAN%' ; // personal

SELECT * from sales_order where TO_CHAR(Order_date,'MON') like 'JAN' ; // Sir

select * from sales_order where client_no like 'C001' or  client_no like 'C002';  // personal

select * from sales_order where client_no in ('C001','C002'); // Sir
 
select * from product_master where sell_price > 2000 and sell_price < 5000;

select Product_No,Description, Sell_price * 1.15 as "New_price" from product_master WHERE Sell_price > 1500 ;
 
select name,city,state from client_master where state not like 'Maharastra';

SELECT TO_CHAR(Delivery_date,'MON') as "Month" , TO_CHAR(Delivery_date,'Day') as "Day" from sales_order where Order_status in'Fullfilled';
 
select TO_CHAR(Order_date,'DD-Month-YY') as " Time Table " from sales_order;

select SYSDATE + 15 from dual;