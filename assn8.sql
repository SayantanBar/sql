SET SERVEROUTPUT ON
DECLARE
s emp1.sal%type;
BEGIN
SELECT sal into s from emp1 WHERE empno=7788;
IF s<35000 THEN
UPDATE emp1 SET sal=35000 where empno=7788;
END IF;
END;

CREATE TABLE temp_emp AS SELECT * FROM emp1 WHERE 1=2;
SET SERVEROUTPUT ON
DECLARE
newrec emp1%rowtype;
BEGIN
SELECT * INTO newrec FROM emp1 WHERE empno=7698;
INSERT INTO temp_emp VALUES (newrec.empno, newrec.ename,newrec.job, newrec.mgr,
newrec.hiredate, newrec.sal, newrec.comm, newrec.deptno);
END;

SET SERVEROUTPUT ON
DECLARE
a VARCHAR2(10);
BEGIN
a :='&a';
dbms_output.put_line('HELLO'||a);
END;

SET SERVEROUTPUT ON
DECLARE
a NUMBER(2);
BEGIN
FOR a in 1..50
LOOP
dbms_output.put_line('value'||a);
END LOOP;
END;

SET SERVEROUTPUT ON
DECLARE
c emp1.comm%type;
BEGIN
SELECT comm into c from emp1 WHERE empno=7369;
IF c IS NULL THEN
UPDATE emp1 SET comm=3000 WHERE empno=7369;
ELSE
c := c*1.25;
UPDATE emp1 SET comm=c WHERE empno=7369;
END IF;
END;

SET SERVEROUTPUT ON
DECLARE
a NUMBER;
r NUMBER;
BEGIN
FOR a IN 1..10 LOOP
r :=MOD(a,2);
IF r=0 THEN
dbms_output.put_line('Even No'||a);
END IF;
END LOOP;
END;

SET SERVEROUTPUT ON
DECLARE
emp_no emp1.empno%type;
salary emp1.sal%type;
hire_month number(4);
BEGIN
emp_no := &emp_no;
select MONTHS_BETWEEN(sysdate, hiredate) into hire_month from emp1 where
empno=emp_no;
if (hire_month > 12*22) then
update emp1 set sal =sal*1.05 where empno = emp_no;
end if;
END;