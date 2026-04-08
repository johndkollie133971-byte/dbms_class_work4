set serveroutput on 
DECLARE 
    v_name   RESULT.NAME%TYPE; 
    v_marks  RESULT.MARKS%TYPE; 
BEGIN 
    -- Accept input from user 
    v_name := '&Enter_Student_Name'; 
 
    -- Fetch student result 
    SELECT MARKS 
    INTO v_marks 
    FROM RESULT 
    WHERE NAME = v_name; 
 
    
    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_name); 
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks); 
 
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        DBMS_OUTPUT.PUT_LINE('Student does not exist in RESULT 
table.'); 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred.'); 
END; 
/ 
 
 
CREATE TABLE RESULT ( 
NAME VARCHAR2(50), 
MARKS NUMBER 
); 

INSERT INTO RESULT VALUES ('John', 85); 
INSERT INTO RESULT VALUES ('Alice', 90); 
COMMIT; 

DESC RESULT;
 
Data (Resuit Tabble) 
NAME    MARKS -------------- 
John    85 
Alice   90 

OUTPUT 
Student Name: John 
Marks: 85 
Enter_Student_Name: Alice 
Student Name: Alice 
Marks: 90