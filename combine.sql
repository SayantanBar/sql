

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



--Assignment 3

select deptno,empno,mgr from emp;
select dname,loc from dept;
select * from emp where deptno=20;
select ENAME,SAL from Emp where Sal > 2500;
select to_char(hiredate,'MONTH-YY')from emp where hiredate<='31-JUL-81';
select ENAME from Emp where JOB not like 'MANAGER';
select ENAME from Emp where ENAME like '%S' ;
select ENAME from Emp where LENGTH(ENAME) = 5 ;
select ename from emp where ename like '__R%';
select ename,sal from emp where sal>1500 and sal<3500;
select ENAME,MGR from Emp where MGR in (7902,7566,7789);
select ename from emp where ename like 'J%' or ename like 'T%';
select ename,job from emp where job like '%M%' or job like '%P%';
select  distinct job from emp;
Select ENAME from Emp where DEPTNO in (10,20);
select ename,sal,1.15*sal "raised salary" from emp;
select max(sal) "max_sal", min(sal) "min sal", avg(sal) "avg_sal" from emp;
select count(distinct job) from emp;
select max(sal)-min(sal)  "diff between sal" from emp;
select sum(sal) from emp;
select ename from emp where deptno=20;
select ename from emp where comm is null;
select count(distinct deptno) from emp;
select ename,job from emp where mgr is null;
select ename from emp where (sysdate-hiredate)/365<38;

--Assignmet 4
select empno,ename,sal from emp order by sal;
select ename,sal,job,deptno from emp order by deptno desc,sal desc;
select ename,sal,pf,hra,da,sal+pf+da+hra GROSS from (select ename,sal,0.12*sal pf,0.15*sal hra,0.9*sal da from emp) order by GROSS;
select max(sal) "maximum salary" from emp where job='SALESMAN';
select avg(sal) "average sal",count(empno) "empno" from emp where deptno=20;
select deptno,count(empno) from emp group by deptno;
select deptno,sum(sal) from emp group by deptno;
select job,count(empno) from emp group by job order by count(empno) desc;
select job,sum(sal) "total sal",max(sal) "max sal",min(sal) "min sal",avg(sal) "avg sal" from emp group by job;
select job,avg(sal) from emp where job!='MANAGER' group by job ;
SELECT sum(sal) sum_sal,max(sal) max_sal,min(sal) min_sal,avg(sal) avg_sal from emp where deptno=20 group by job;
select job,deptno,avg(sal) from emp group by deptno,job;
select deptno,count(empno) "no of employees",avg(sal) from emp group by deptno having count(empno)>5;
select job,max(sal) from emp group by job having max(sal)>=5000;
SELECT job, sum(sal) sum_sal,max(sal) max_sal,min(sal) min_sal,avg(sal) avg_sal from emp where deptno=20  group by job having avg(sal)>1000 ;
SELECT job, sum(sal) sum_sal,max(sal) max_sal,min(sal) min_sal,avg(sal) avg_sal from emp where deptno=20  group by job having avg(sal)>1000 order by sum(sal) desc;
select avg(max_sal) from (select max(sal) max_sal from emp group by deptno); 
select job,stddev(sal) from emp group by job having stddev(sal)>0;
select count(empno) from emp where comm>300;
select sum(nvl(comm,100)) from emp group by deptno order by deptno desc;
select count(job) from emp where job='MANAGER';
SELECT ename,nvl(to_char(comm),'Not Applicable') from emp where ename like '%M%' order by ename desc;
select ename,sal,nvl2(comm,comm+sal,sal) from emp where ename like '%M%' order by ename; 
select ename from emp where substr(ename,1,1) like upper(substr(ename,1,1));
select distinct(substr(job,2,4)) FROM emp where job like 'SALESMAN';



--Assignment 5

select empno,ename,dname from emp,dept where emp.deptno=dept.deptno;
select empno,ename,dept.deptno,dname ,loc from emp,dept where emp.deptno=dept.deptno;
select ename,dname,loc from emp,dept where emp.deptno(+)=dept.deptno;
select w.ename "worker",m.ename "manager" from emp w,emp m where w.mgr=m.empno;
select w.ename "worker",m.ename "manager" from emp w,emp m where w.mgr=m.empno(+);
select w.ename "worker",w.hiredate "worker hiredate",m.ename "manager" ,m.hiredate "manager_hiredate" from emp w,emp m where w.mgr=m.empno and w.hiredate<m.hiredate;
select w.ename "worker",w.job "job",w.sal "sal",m.ename "boss" from emp w,emp m where w.mgr=m.empno;
select w.ename "worker",w.sal "worker sal",m.ename "boss" ,m.sal "boss sal" from emp w,emp m where w.mgr=m.empno and w.sal>m.sal;
select(select min(sal) from emp group by job having job=(select job from emp where ename like 'BLAKE'))-sal "RESULT" from emp where ename like 'MILLER';
select w.ename ||' works for '|| m.ename "employees and their manager" from emp w,emp m where w.mgr=m.empno and w.ename like '%A%';
select job from emp where deptno=20 union select job from emp where deptno=30;
select job from emp where deptno=20 intersect select job from emp where deptno=30;
select job from emp where deptno=20 minus select job from emp where deptno !=20;
select * from emp where deptno=(select deptno from emp where ename like 'MILLER');
select * from emp where sal>(select avg(sal) from emp where hiredate>'01-APR-81');
SELECT job, AVG(sal)  avg_sal FROM emp GROUP BY job HAVING AVG(sal) = (SELECT MAX(avg_sal) FROM (SELECT AVG(sal)  avg_sal FROM emp GROUP BY job));
SELECT * FROM emp WHERE deptno in (SELECT deptno FROM emp WHERE mgr = 7698);
select ENAME from EMP where SAL in (select MIN(SAL) from EMP group by DEPTNO);
select *  from EMP e1 where sal>(select AVG(SAL) from EMP e2 where e1.DEPTNO=e2.DEPTNO);
select ENAME from EMP where DEPTNO=(select DEPTNO from DEPT where LOC='DALLAS') and SAL>(select MIN(SAL) from EMP where DEPTNO=(select DEPTNO from DEPT where LOC='CHICAGO'));

--assignment 6

create table emp_new as select * from  emp;
create table dept_new as select * from dept;
alter table dept_new modify deptno primary key;
alter table emp_new add Grade varchar(1);
alter table emp_new add constraint emp_noPri PRIMARY key(empno);
ALTER TABLE emp_new ADD CONSTRAINT emp_dept_fk FOREIGN KEY (deptno) REFERENCES dept_new(deptno);
alter table emp_new add check(sal>750);
ALTER TABLE emp_new MODIFY sal NUMBER(10,2) NOT NULL;
ALTER TABLE emp_new MODIFY ename VARCHAR2(35);
ALTER TABLE emp_new DROP CONSTRAINT emp_noPri;
ALTER table dept_new disable primary key;
ALTER table dept_new enable primary key;
SELECT COLUMN_NAME, CONSTRAINT_NAME FROM USER_CONS_COLUMNS WHERE TABLE_NAME = 'EMP_NEW';
ALTER TABLE dept_new DROP PRIMARY key cascade;
CREATE TABLE emp_new1 AS SELECT * FROM emp;
CREATE TABLE dept_new1 AS SELECT * FROM dept;
alter table dept_new1 modify deptno primary key;
ALTER TABLE emp_new1 ADD CONSTRAINT emp_dept_fk1 FOREIGN KEY (deptno) REFERENCES dept_new1(deptno);
drop table dept_new1;
/*output--drop table dept_new1
           *
ERROR at line 1:
ORA-02449: unique/primary keys in table referenced by foreign keys
*/
COMMENT ON TABLE emp IS 'Employee Information of XYZ Company';
COMMENT ON COLUMN dept.deptno IS 'Unique depart of XYZ Company';
SELECT COMMENTS,TABLE_NAME,COLUMN_NAME FROM USER_COL_COMMENTS WHERE TABLE_NAME = 'DEPT' AND COLUMN_NAME = 'DEPTNO';
select comments,table_name from user_tab_comments where table_name like 'EMP';
COMMENT ON TABLE emp IS '';
RENAME emp to emp_change;
truncate table emp_new1;
DROP table dept_new1 CASCADE CONSTRAINTS;
alter table emp_new drop column grade;
ALTER TABLE emp_new RENAME column comm TO commission;
ALTER TABLE emp_new SET unused column (commission);
SELECT column_name FROM user_unused_col_tabs WHERE table_name = 'EMP_NEW';
ALTER TABLE emp_new DROP UNUSED COLUMNS;



--Assignment 7

create view D_10EMP as select * from emp where deptno = 10;
select * from d10_emp;
create view dept_summary as select d.dname, min(e.sal) minsal, max(e.sal) maxsal, avg(e.sal) avgsal from dept d, emp e group by dname;
select * from dept_summary;
create or replace view emp_data as select * from emp where sal between 1000 and 2000 and mgr in (select empno from emp);
select * from emp_data;
create view restrict as select * from emp where ename = '&ename' and to_char(sysdate, 'hh24') between 9 and 17 and to_char(sysdate, 'd') between 2 and 7;
select * from restrict;
create view employees as select empno, ename, job, deptno from emp where deptno in (select deptno from dept);
select * from employees;
create or replace view emp_read as select job, min(sal) minsal, max(sal) maxsal from emp group by job with read only;
select * from emp_read;
create view vw_client_master as select client_no, name, address1, balance_due from client_master;
select * from vw_client_master;
insert into vw_client_master values ('C007', 'ANKUR', 'BALLY', 0);
select * from vw_client_master;
update vw_client_master set balance_due = 1300 where client_no = 'C007';
select * from vw_client_master;
delete from vw_client_master where client_no = 'C007';
select * from vw_client_master;
select * from client_master;
create view vw_sales_det as select so.order_no, so.order_date, sod.product_no, sod.qty_ordered, so.order_status from sales_order so inner join sales_order_details sod on so.order_no = sod.order_no where so.order_status = 'BackOrder';
select * from vw_sales_det;
insert into vw_sales_det values ('O19032', '15-JAN-97', 'P00032', 2, 'BackOrder');
select * from vw_sales_det;
update vw_sales_det set qty_ordered = 7 where order_no = 'O19002';
select * from vw_sales_det;
delete vw_sales_det where order_no = 'O19002';
select * from vw_sales_det;
drop view vw_sales_det;