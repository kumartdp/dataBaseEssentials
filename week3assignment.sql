use intercollegiate_athletic1;
SELECT DISTINCT city, state, zip
FROM CUSTOMER;

/**  2 
List the name, department, phone number, and email address of employees with a phone number beginning with “3-”.
**/
SELECT empname, department, phone, email FROM EMPLOYEE WHERE phone LIKE '3-%';

/**  3 
List all columns of the resource table with a rate between $10 and $20. Sort the result by rate.**/
SELECT * FROM RESOURCETBL WHERE rate BETWEEN 10 AND 20 ORDER BY rate ASC;

/**  4  
List the event requests with a status of “Approved” or “Denied” and an authorized date in July 2018. Include the event number, authorization date, and status in the output.
**/
SELECT eventno, dateauth, status
FROM EVENTREQUEST
WHERE status != 'Pending'
AND dateauth BETWEEN '2018-07-01' AND '2018-07-31';

/**  5  
List the location number and name of locations that are part of the “Basketball arena”.  Your WHERE clause should not have a condition involving the facility number compared
to a constant (“F101”). Instead, you should use a condition on the FacName column for the value of “Basketball arena”.
**/
SELECT locno, locname
FROM LOCATION, FACILITY
WHERE LOCATION.facno = FACILITY.facno
AND facname = 'Basketball arena';

/**  6  **
For each event plan, list the plan number, count of the event plan lines, and sum of the number of resources assigned. For example, plan number “P100” has 4 lines and 7
resources assigned. You only need to consider event plans
that have at least one line.
**/
SELECT planno, COUNT(*), SUM(numberfld)
FROM EVENTPLANLINE
GROUP BY planno;