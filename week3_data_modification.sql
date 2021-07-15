/**Insert a new row into the Facility table with facility name “Swimming Pool”.
**/
INSERT INTO FACILITY (facno, facname)
VALUES ('F104', 'Swimming Pool');

/**  2  **
Insert a new row in the Location table related to the Facility row in modification problem 1. The new row should have “Door” for the location name.
**/
INSERT INTO LOCATION (locno, facno, locname)
VALUES ('L107', 'F104', 'Door');

/**  3 
Insert a new row in the Location table related to the Facility row in modification problem 1. The new row should have “Locker Room” for the location
 name. **/
INSERT INTO LOCATION (locno, facno, locname)
VALUES ('L108', 'F104', 'Locker Room');

/**  4  **
Change the location name of “Door” to “Gate” for the row
inserted in modification problem 2. **/
UPDATE LOCATION
SET locname = 'Gate'
WHERE locno = 'L107';

/**  5 
Delete the row inserted in modification problem 3.
**/
DELETE FROM LOCATION
WHERE locno = 'L108';