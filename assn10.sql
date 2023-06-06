SET SERVEROUTPUT ON
DECLARE  
vname emp1.ename%type;
vjob emp1.job%type;
BEGIN
select ename, job into vname, vjob from emp1 where hiredate between '01-JAN-97' and '31-DEC-97';
dbms_output.put_line(vname ||' '|| vjob);
EXCEPTION
WHEN NO_DATA_FOUND THEN
dbms_output.put_line('No Employee hired in 1997');
END;

SET SERVEROUTPUT ON
DECLARE
out_of_stock EXCEPTION;
qty_on_hand NUMBER(5);
BEGIN
IF qty_on_hand < 1 THEN
RAISE out_of_stock;
END IF;
EXCEPTION
WHEN out_of_stock THEN
dbms_output.put_line ('INSUFFICIENT STOC');
END;

SET SERVEROUTPUT ON
DECLARE
user_error EXCEPTION;
PRAGMA EXECPTION_INIT(user_error, -0150);
BEGIN
insert into emp values( NULL, 'ANKUR', 'RESEARCH', 7900, '12-MAY-2002', 90000,1200,200);
EXECPTION
WHEN user_error THEN
DBMS_OUTPUT.PUT_LINE ('CANNOT INSERT NULL VALUES');
END;