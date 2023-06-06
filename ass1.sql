CREATE TABLE client_master(
Client_no varchar2(6) Primary key check(Client_no like 'C%'),
Name varchar2(30) not null,
Address1 varchar2(30),
Address2 varchar2(30),
City varchar2(15),
State varchar2(15),
Pincode number(6),
Balance_due number(10,2));


INSERT into client_master
values('C001','Ivan Bayross','P-76','Worli','Bombay','Maharastra',400054,15000);

INSERT into client_master
values('C002','Vandana Satiwal','128','Admas Street','Madras','Tamilnadu',780001,0);

INSERT into client_master
values('C003','Pramada Juguste','157','Gopalpur','Kolkata','West Bengal',700058,5000);

INSERT into client_master
values('C004','Basu Navingdi','A/12','Nariman','Bombay','Maharastra',40056,0);


INSERT into client_master
values('C005','Ravi Sridharan','B/34','Rajnagar','Delhi','DELHI',100001,2000);

INSERT into client_master
values('C006','Rukmini','Q-12','Bandra','Bombay','Maharastra',40050,0);

CREATE TABLE product_master (
  Product_no VARCHAR2(6) CONSTRAINT product_no_pk PRIMARY KEY CHECK (Product_no LIKE 'P%'),
  Description VARCHAR2(40) NOT NULL,
  Profit_percent NUMBER(4,2) NOT NULL,
  Unit_measure VARCHAR2(10) NOT NULL,
  Qty_on_hand NUMBER(8) NOT NULL,
  Reorder_level NUMBER(8) NOT NULL,
  Sell_price NUMBER(8,2) NOT NULL CHECK (Sell_price > 0),
  Cost_price NUMBER(8,2) NOT NULL CHECK (Cost_price > 0)
);


INSERT into product_master
values('P00001','1.44 Floppies',5,'Piece',100,20,525,500);


INSERT into product_master
values('P03453','Monitors',6,'Piece',10,3,12000,11280);

INSERT into product_master
values('P06734','Mouse',5,'Piece',20,5,1050,1000);

INSERT into product_master
values('P07865','1.22 Floppies',5,'Piece',100,20,525,500);

INSERT into product_master
values('P07868','Keyboard',2,'Piece',10,3,3150,3050);

INSERT into product_master
values('P07885','CD drive',2.5,'Piece',10,3,5250,5100);

INSERT into product_master
values('P07965','540 HDD',4,'Piece',10,3,8400,8000);

INSERT into product_master
values('P07975','1.44 Drive',4,'Piece',10,3,1050,900);

INSERT into product_master
values('P08865','1.22 Drive',5,'Piece',2,3,1025,850);



CREATE TABLE salesman_master (
  Salesman_no VARCHAR2(6) CONSTRAINT Salesman_no_pk PRIMARY KEY CHECK (Salesman_no LIKE 'S%'),
  Salesman_name VARCHAR2(30) NOT NULL,
  Address1 VARCHAR2(30)NOT NULL,
  Address2 VARCHAR2(30) ,
  City VARCHAR2(20) ,
  Pincode NUMBER(8) ,
  State VARCHAR2(20),
  Sal_amt NUMBER(8,2) NOT NULL CHECK (Sal_amt > 0));
  
INSERT into salesman_master
values('S001', 'Kiran', 'A/14', 'Worli', 'Bombay', 400002 ,'Maharastra', 3000);

INSERT into salesman_master
values('S002', 'Manish' ,'65', 'Nariman', 'Bombay' ,400001 ,'Maharastra', 3000);

INSERT into salesman_master
values('S003', 'Ravi', 'P-7', 'Bandra' ,'Bombay', 400032 ,'Maharastra', 3000);


INSERT into salesman_master
values('S004', 'Asish' ,'A/5', 'Juhu', 'Bombay', 400044 ,'Maharastr', 3000);


CREATE TABLE sales_order (
    Order_no VARCHAR2(6) NOT NULL PRIMARY KEY CHECK (Order_no LIKE 'O%'),
    Order_date DATE,
    Client_no VARCHAR2(6),
    Salesman_no VARCHAR2(6),
    Delivery_type CHAR(1) DEFAULT 'F' CHECK (Delivery_type IN ('P', 'F')),
    Bill_y_n CHAR(1),
    Delivery_date DATE,
    Order_status VARCHAR2(10) CHECK (Order_status IN ('InProcess', 'Fullfilled', 'BackOrder', 'Cancelled')),
    FOREIGN KEY (Client_no) REFERENCES Client_master (Client_no),
    FOREIGN KEY (Salesman_no) REFERENCES salesman_master (Salesman_no),
    CHECK (Delivery_date >= Order_date)
);


insert into sales_order  
VALUES('O19001','12-Jan-96','C001','S001','F','N','20-Jan-96','InProcess');

insert into sales_order  
VALUES('O19002' ,'25-Jan-96', 'C002' ,'S002', 'P', 'N', '27-Jan-96', 'BackOrder');

insert into sales_order  
VALUES('O46865', '18-Feb-96' ,'C003' ,'S003', 'F', 'Y', '20-Feb-96' ,'Fullfilled');



insert into sales_order  
VALUES('O19003', '03-Apr-96' ,'C001', 'S001' ,'F', 'Y' ,'07-Apr-96' ,'Fullfilled');

insert into sales_order  
VALUES('O46866', '20-May-96' ,'C004', 'S002' ,'P' ,'N' ,'22-May-96' ,'Cancelled');

insert into sales_order  
VALUES('O19008' ,'24-May-96' ,'C005' ,'S004', 'F','N' ,'26-May-96' ,'InProcess');



CREATE TABLE sales_order_details (
    Order_no VARCHAR2(6),
    Product_no VARCHAR2(6),
	Qty_ordered NUMBER(8),
    Qty_disp NUMBER(8),
	Product_rate NUMBER(10,2),
    FOREIGN KEY (Order_no) REFERENCES sales_order (Order_no),
    FOREIGN KEY (Product_no) REFERENCES product_master(Product_no)   
);

insert into sales_order_details 
VALUES('O19001','P00001', 4, 4 ,525);

insert into sales_order_details 
VALUES('O19001', 'P07965', 2, 1, 8400);

insert into sales_order_details 
VALUES('O19001', 'P07885', 2, 1, 5250);

insert into sales_order_details 
VALUES('O19002', 'P00001', 10, 0, 525);

insert into sales_order_details 
VALUES('O46865', 'P07868', 3, 3, 3150);

insert into sales_order_details 
VALUES('O46865', 'P07885', 3, 1, 5250);

insert into sales_order_details 
VALUES('O46865', 'P00001', 10, 10, 525);

insert into sales_order_details 
VALUES('O46865', 'P03453', 4, 4, 1050);

insert into sales_order_details 
VALUES('O19003', 'P03453', 2, 2, 1050);

insert into sales_order_details 
VALUES('O19003', 'P06734', 1, 1, 12000);

insert into sales_order_details 
VALUES('O46866', 'P07965', 1, 0, 8400);

insert into sales_order_details 
VALUES('O46866', 'P07975', 1, 0, 1050);

insert into sales_order_details 
VALUES('O19008', 'P00001', 10, 5, 525);

insert into sales_order_details 
VALUES('O19008', 'P07975', 5, 3, 1050);

commit;