SET SURVEROUTPUT ON
DECLARE
  CURSOR emp_cursor IS
    SELECT empno, ename, sal, comm
    FROM emp1
    WHERE sal + NVL(comm, 0) > 25000;
BEGIN
  FOR emp_rec IN emp_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_rec.empno || ', Name: ' || emp_rec.ename || ', Salary: ' || emp_rec.sal || ', Commission: ' || emp_rec.comm);
  END LOOP;
END;

SET SERVEROUTPUT ON
DECLARE
CURSOR C2 IS SELECT empno, sal, ename from emp1 order by sal desc;
BEGIN
FOR record1 IN C2
LOOP
INSERT INTO message(EmpNumber, Name,Salary)
VALUES (record1.empno, record1.ename, record1.sal);
EXIT WHEN C2%ROWCOUNT=5;
END LOOP;
COMMIT;
END;

Create table emp_sal(
    emp_id varchar2(8) Primary key,
    cur_sal number(7,2) NOT NULL,
    inc_date date NOT NULL
    );
SET SERVEROUTPUT ON
DECLARE
inc number;
emp_sal_rec emp_sal%ROWTYPE;
CURSOR cur is select * from emp1 where deptno = (select deptno from dept1
where dname LIKE 'RESEARCH');
BEGIN
FOR emp_sal_rec in cur
LOOP
inc := emp_sal_rec.sal*1.02;
insert into emp_sal values (emp_sal_rec.empno, inc, sysdate);
END LOOP;
END;

DECLARE
dno number := &deptno;
BEGIN
update dept1 set loc ='KOLKATA' where deptno = dno;
if (SQL%FOUND) then
DBMS_OUTPUT.PUT_LINE('Updated');
else
DBMS_OUTPUT.PUT_LINE('Data NOT Found');
end if;
END;

SET SERVEROUTPUT ON
DECLARE
user_error EXCEPTION;
PRAGMA EXCEPTION_INIT(user_error, -0150);
BEGIN
insert into emp1 values( NULL, 'Ankur', 'Intern', 7900, '12-MAY-2002', 90000,1200,20);
EXCEPTION
WHEN user_error THEN
DBMS_OUTPUT.PUT_LINE ('CANNOT INSERT NULL VALUES');
END;