select name from client_master where name like '_a%';
select name from client_master where city not like 'B%';
select name,city from client_master where length(name)=12 and name like 'I%';
select * from client_master where city in ('Bombay','Delhi');
select * from client_master where balance_due>10000;
SELECT * from sales_order where TO_CHAR(Order_date,'MON') like 'JAN' ;
select * from client_master where client_no in('C001','C002');
select description from product_master where sell_price>2000 and sell_price<5000;
select description,sell_price,sell_price*1.15 "New_price" from product_master where sell_price>1500;
select name,city,state from client_master where state not like 'Maharastra';
select to_char(delivery_date,'DD-Mon') "date and month" from sales_order where order_status in 'Fullfilled';
select to_char(order_date,'DD-MONTH-YY') "order date" from sales_order;
select sysdate+15 "date" from dual;