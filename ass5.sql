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




