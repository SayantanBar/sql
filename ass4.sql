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







