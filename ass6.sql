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






