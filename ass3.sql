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




