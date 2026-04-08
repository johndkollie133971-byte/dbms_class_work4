set serveroutput on 
DECLARE 
     
    CURSOR emp_cursor IS 
        SELECT * 
        FROM EMP 
        WHERE DEPTNO = &Enter_Dept_No; 
 
    
    emp_rec EMP%ROWTYPE; 
 
    
    NO_DEPT_FOUND EXCEPTION; 
 
    v_count NUMBER := 0; 
 
BEGIN 
    OPEN emp_cursor; 
 
    LOOP 
        FETCH emp_cursor INTO emp_rec; 
        EXIT WHEN emp_cursor%NOTFOUND; 
 
         
        INSERT INTO EMP_BACKUP 
        VALUES emp_rec;

 v_count := v_count + 1; 
    END LOOP; 
 
    CLOSE emp_cursor; 
 
    
    IF v_count = 0 THEN 
        RAISE NO_DEPT_FOUND; 
    ELSE 
        DBMS_OUTPUT.PUT_LINE(v_count || ' record(s) inserted into 
EMP_BACKUP.'); 
    END IF; 
 
EXCEPTION 
    WHEN NO_DEPT_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('No employees found for given 
department number.'); 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred.'); 
END; 
/ 
 
CREATE TABLE EMP ( 
    EMPNO NUMBER, 
    ENAME VARCHAR2(50), 
    JOB VARCHAR2(50), 
    MGR NUMBER, 
    HIREDATE DATE, 
    SAL NUMBER, 
    COMM NUMBER, 
    DEPTNO NUMBER 


); 

INSERT INTO EMP VALUES (1, 'John', 'Manager', 101, SYSDATE, 50000, 
NULL, 10); 
INSERT INTO EMP VALUES (2, 'David', 'Clerk', 102, SYSDATE, 20000, 
NULL, 20); 
INSERT INTO EMP VALUES (3, 'Smith', 'Analyst', 103, SYSDATE, 30000, 
NULL, 10); 
COMMIT; 

CREATE TABLE EMP_BACKUP AS 
SELECT * FROM EMP WHERE 1=0; 
FROM HR.EMP 

Data EMP(Table) 
EMPNO  ENAME   JOB      MGR   HIREDATE   SAL    COMM   DEPTNO ------------------------------------------------------------- 
1      John    Manager  101   ...        50000  NULL   10 
2      David   Clerk    102   ...        
3      Smith   Analyst  103   ...        
20000  NULL   20 
30000  NULL   10 

2 record(s) inserted into EMP_BACKUP.