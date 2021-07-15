/**  1  **
For event requests, list the event number, event date
(eventrequest.dateheld), and count of the event plans. Only
include event requests in the result if the event request
has more than one related event plan with a work date in
December 2018.
*/
SELECT EVENTREQUEST.eventno, dateheld, COUNT(*) AS 'num_event_plans'
FROM EVENTREQUEST, EVENTPLAN
WHERE EVENTREQUEST.eventno = EVENTPLAN.eventno
AND workdate BETWEEN '2018-12-01' AND '2018-12-31'
GROUP BY eventno
HAVING COUNT(*) > 1;

/**  2 
List the plan number, event number, work date, and activity
of event plans meeting the following two conditions: (1)
the work date is in December 2018 and (2) the event is held
in the “Basketball arena”.  Your query must not use the
facility number (“F101”) of the basketball arena in the
WHERE clause. Instead, you should use a condition on the
FacName column for the value of “Basketball arena”.
*/
SELECT planno, EVENTPLAN.eventno, workdate, activity
FROM FACILITY, EVENTREQUEST, EVENTPLAN
WHERE FACILITY.facno = EVENTREQUEST.facno
AND EVENTREQUEST.eventno = EVENTPLAN.eventno
AND facname = 'Basketball arena'
AND workdate BETWEEN '2018-12-01' AND '2018-12-31';

/**  3  ***************************************************
List the event number, event date, status, and estimated
cost of events where there is an event plan managed by Mary
Manager and the event is held in the basketball arena in
the period October 1 to December 31, 2018.  Your query must
not use the facility number (“F101”) of the basketball
arena or the employee number (“E101”) of “Mary Manager” in
the WHERE clause. Thus, the WHERE clause should not have
conditions involving the facility number or employee number
compared to constant values.
***********************************************************/
SELECT EVENTREQUEST.eventno, dateheld, status, estcost
FROM EVENTREQUEST, FACILITY, EVENTPLAN, EMPLOYEE
WHERE EVENTREQUEST.facno = FACILITY.facno
AND EVENTREQUEST.eventno = EVENTPLAN.eventno
AND EVENTPLAN.empno = EMPLOYEE.empno
AND facname = 'Basketball arena'
AND empname = 'Mary Manager'
AND dateheld BETWEEN '2018-10-01' AND '2018-12-31';

/**  4  ***************************************************
List the plan number, line number, resource name, number of
resources (eventplanline.number), location name, time
start, and time end where the event is held at the
basketball arena, the event plan has activity of activity
of “Operation”, and the event plan has a work date in the
period October 1 to December 31, 2018.  Your query must not
use the facility number (“F101”) of the basketball arena in
the WHERE clause. Instead, you should use a condition on
the FacName column for the value of “Basketball arena”.
***********************************************************/
SELECT EVENTPLANLINE.planno, lineno, resname, numberfld,
	   locname, timestart, timeend
FROM EVENTPLANLINE, EVENTPLAN, RESOURCETBL, LOCATION,
     FACILITY
WHERE EVENTPLANLINE.planno = EVENTPLAN.planno
AND EVENTPLANLINE.resno = RESOURCETBL.resno
AND EVENTPLAN.locno = LOCATION.locno
AND LOCATION.facno = FACILITY.facno
AND facname = 'Basketball arena'
AND activity = 'Operation'
AND workdate BETWEEN '2018-10-01' AND '2018-12-31';

