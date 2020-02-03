/* Welcome to the SQL mini project. For this project, you will use
Springboard' online SQL platform, which you can log into through the
following link:

https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

Note that, if you need to, you can also download these tables locally.

In the mini project, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */

/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. */

SELECT `name`
FROM `Facilities`
WHERE `membercost` =0
LIMIT 0 , 30   (system set limit automaticity) 

name
Badminton Court
Table Tennis
Snooker Table
Pool Table


/* Q2: How many facilities do not charge a fee to members? */

SELECT COUNT( * )
FROM `Facilities`
WHERE `membercost` =0

count(*)
4

/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

SELECT `facid` , `name` , `membercost` , `monthlymaintenance`
FROM `Facilities`
WHERE `membercost` !=0
AND `membercost` < ( `monthlymaintenance` * 0.2 )

facid 	name	membercost	monthlymaintenance
0	Tennis Court 1	5.0	200
1	Tennis Court 2	5.0	200
4	Massage Room 1	9.9	3000
5	Massage Room 2	9.9	3000
6	Squash Court	3.5	80


/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */
SELECT *
FROM `Facilities`
WHERE `facid` IN (1, 5)

facid   	name	     membercost 	guestcost	initialoutlay   	monthlymaintenance
1   	Tennis Court        25.0        	25.0       	8000        	200
5	   Massage Room2        9.9         	80.0        4000        	3000

/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */

1. List of 'cheap'

SELECT `name` , `monthlymaintenance`
FROM `Facilities`
WHERE `monthlymaintenance` <100

name             monthlymaintenance
Badminton Court      50
Table Tennis         10
Squash Court         80
Snooker Table        15
Pool Table           15

2. List of 'expensive'

SELECT `name` , `monthlymaintenance`
FROM `Facilities`
WHERE `monthlymaintenance` >100

name              monthlymaintenance
Tennis Court 1           200
Tennis Court 2           200
Massage Room 1           3000
Massage Room 2           3000


/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */

First signed up: GUEST GUEST  2012-07-01 00:00:00

SELECT `firstname` , `surname` , `joindate`
FROM `Members`
ORDER BY `joindate` 

Last signed up: Darren Smith  2012-09-26 18:08:45

SELECT `firstname` , `surname` , `joindate`
FROM `Members`
ORDER BY `joindate` DESC


/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */

SELECT Facilities.facid AS fac_id,
	   Facilities.name,
	   Bookings.memid AS member_id,
	   CONCAT (Members.firstname, ' ', Members.surname) AS Members_Name
	   
FROM Facilities

LEFT JOIN Bookings 
ON Facilities.facid  = Bookings.facid

LEFT JOIN Members
ON Bookings.memid = Members.memid
	
WHERE Facilities.facid = 0 OR Facilities.facid = 1
GROUP BY Members.firstname

fac_id	name	member_id	Members_Name
0	Tennis Court 1	12	Anne Baker
0	Tennis Court 1	6	Burton Tracy
0	Tennis Court 1	10	Charles Owen
1	Tennis Court 2	1	Darren Smith
0	Tennis Court 1	11	David Jones
0	Tennis Court 1	26	Douglas Jones
0	Tennis Court 1	36	Erica Crumpet
0	Tennis Court 1	15	Florence Bader
0	Tennis Court 1	5	Gerald Butters
0	Tennis Court 1	0	GUEST GUEST
1	Tennis Court 2	27	Henrietta Rumney
0	Tennis Court 1	14	Jack Smith
0	Tennis Court 1	4	Janice Joplette
0	Tennis Court 1	13	Jemima Farrell
0	Tennis Court 1	22	Joan Coplin
0	Tennis Court 1	35	John Hunt
0	Tennis Court 1	20	Matthew Genting
1	Tennis Court 2	30	Millicent Purview
0	Tennis Court 1	7	Nancy Dare
0	Tennis Court 1	9	Ponder Stibbons
0	Tennis Court 1	24	Ramnaresh Sarwin
0	Tennis Court 1	3	Tim Rownam
0	Tennis Court 1	16	Timothy Baker
0	Tennis Court 1	2	Tracy Smith


/* Q8: How can you produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30? Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */

SELECT Bookings.starttime,
	   Facilities.name AS facid_name,
	   Bookings.memid AS member_id,
	   CONCAT (Members.firstname, ' ', Members.surname) AS Members_Name,
	   (Facilities.membercost * Bookings.slots *2) + (Facilities.guestcost * Bookings.slots *2) AS cost

FROM Bookings

RIGHT JOIN Facilities 
ON Facilities.facid  = Bookings.facid

RIGHT JOIN Members
ON Bookings.memid = Members.memid
	
WHERE (Bookings.starttime LIKE '2012-09-14%')
AND (Facilities.membercost * Bookings.slots * 2 > 30 OR Facilities.guestcost* Bookings.slots * 2 >30) 
	 
GROUP BY cost

starttime	facid_name	member_id	Members_Name	cost
2012-09-14 08:30:00	Squash Court	12	Anne Baker	84.0
2012-09-14 08:00:00	Badminton Court	1	Darren Smith	93.0
2012-09-14 09:30:00	Squash Court	0	GUEST GUEST	168.0
2012-09-14 08:00:00	Tennis Court 1	6	Burton Tracy	180.0
2012-09-14 08:00:00	Massage Room 1	14	Jack Smith	359.6
2012-09-14 08:00:00	Tennis Court 2	11	David Jones	360.0
2012-09-14 14:00:00	Massage Room 1	13	Jemima Farrell	719.2


/* Q9: This time, produce the same result as in Q8, but using a subquery. */
SELECT Bookings.starttime,
	   Facilities.name AS facid_name,
	   Bookings.memid AS member_id,
	   CONCAT (Members.firstname, ' ', Members.surname) AS Members_Name,
	   
FROM Bookings

RIGHT JOIN Facilities 
ON Facilities.facid  = Bookings.facid

RIGHT JOIN Members
ON Bookings.memid = Members.memid
	
WHERE (Bookings.starttime LIKE '2012-09-14%')
AND (Facilities.membercost * Bookings.slots * 2 > 30 OR Facilities.guestcost* Bookings.slots * 2 >30) 
(SELECT (Facilities.membercost * Bookings.slots *2) + (Facilities.guestcost * Bookings.slots *2) AS cost)
	 
GROUP BY cost

starttime	facid_name	member_id	Members_Name	cost
2012-09-14 08:30:00	Squash Court	12	Anne Baker	84.0
2012-09-14 08:00:00	Badminton Court	1	Darren Smith	93.0
2012-09-14 09:30:00	Squash Court	0	GUEST GUEST	168.0
2012-09-14 08:00:00	Tennis Court 1	6	Burton Tracy	180.0
2012-09-14 08:00:00	Massage Room 1	14	Jack Smith	359.6
2012-09-14 08:00:00	Tennis Court 2	11	David Jones	360.0
2012-09-14 14:00:00	Massage Room 1	13	Jemima Farrell	719.2


/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

SELECT Facilities.name AS facid_name,
	   (Facilities.membercost * Bookings.slots * 2) + (Facilities.guestcost* Bookings.slots * 2 ) AS revenue
	   
FROM Facilities

LEFT JOIN Bookings
ON Facilities.facid  = Bookings.facid
	
WHERE (Facilities.membercost * Bookings.slots * 2) + (Facilities.guestcost* Bookings.slots * 2 ) <= 1000
	 
GROUP BY (Facilities.membercost * Bookings.slots * 2) + (Facilities.guestcost* Bookings.slots * 2 )


facid_name	revenue
Pool Table	10.0
Table Tennis	20.0
Pool Table	30.0
Snooker Table	40.0
Squash Court	84.0
Badminton Court	93.0
Squash Court	168.0
Tennis Court 1	180.0
Badminton Court	186.0
Squash Court	252.0
Badminton Court	279.0
Squash Court	336.0
Massage Room 1	359.6
Tennis Court 2	360.0
Tennis Court 1	540.0
Squash Court	588.0
Massage Room 1	719.2
Tennis Court 1	720.0











