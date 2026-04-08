set serveroutput on 
DECLARE 
    v_name   VARCHAR2(50); 
    v_salary NUMBER; 
BEGIN 
     
    v_name := '&Enter_Employee_Name'; 
 
    SELECT SAL 
    INTO v_salary 
    FROM EMP 
    WHERE ENAME = v_name; 
 
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name); 
    DBMS_OUTPUT.PUT_LINE('Basic Salary: ' || v_salary); 
 
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('Employee does not exist.'); 
    WHEN TOO_MANY_ROWS THEN 
        DBMS_OUTPUT.PUT_LINE('Multiple employees found.'); 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM); 
END; 
/ 
 
 
CREATE TABLE EMP ( 
    ENAME VARCHAR2(50),

SAL NUMBER 
); 

INSERT INTO EMP VALUES ('John', 30000); 
NSERT INTO EMP VALUES ('Peter', 20000); 
NSERT INTO EMP VALUES ('johnson', 40000); 
COMMIT; 

SELECT table_name FROM user_tables;
 
Output Of select 
ENAME     SAL ---------------- 
John      
30000 
Peter     20000 
johnson   40000
 
Enter_Employee_Name: John 
Employee Name: John 
Basic Salary: 30000 
s 
Enter_Employee_Name: Peter 
Employee Name: Peter 
Basic Salary: 20000 


Enter_Employee_Name: johnson 
Employee Name: johnson 
Basic Salary: 40000 
