set serveroutput on 
DECLARE 
    num1 NUMBER := 10; 
    num2 NUMBER := 0; 
    result NUMBER; 
BEGIN 
    result := num1 / num2; 
 
    DBMS_OUTPUT.PUT_LINE('Result = ' || result); 
 
EXCEPTION 
    WHEN ZERO_DIVIDE THEN 
        DBMS_OUTPUT.PUT_LINE('Error: Division by zero is not 
allowed.'); 
END; 
/ 
 
 
output for (execution) 
 
Error: Division by zero is not allowed. 
 
PL/SQL procedure successfully completed.