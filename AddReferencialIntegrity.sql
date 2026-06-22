-- Question 1

alter table ORDERS
add foreign key (USERID) references REVIEWS(USERID);

commit;

alter table REVIEWS
add foreign key (PRODUCTCODE) references uUSERLIBRARY(USERID);

commit;

alter table USERLIBRARY
add foreign key (USERID) references reviews(USERID);

commit;

-- Question 2

select FULL_NAME as FIRSTNAME || ' ' || LASTNAME, USERNAME
from USERBASE
where BIRTHDAY <= date '2007-08-16';

commit;

-- Question 3

select max(length(USERNAME)) as MAX_USERNAME_LENGTH,
    avg(length(USERNAME)) as AVG_USERNAME_LENGTH
from USERBASE;

commit;

-- Question 4

select QUESTION
from SECURITYQUESTION
where QUESTION like 'What is%' or QUESTION like 'What was%';

commit;

-- Question 5

select PRODUCTCODE, min(RATING) as LOWET_RATING, count(REVIEW) as REVIEW_COUNT
from REVIEWS
group by PRODUCTCODE
order by REVIEW_COUNT desc;

commit;

-- Question 6

select PRODUCTCODE, count(USERID)
from wishlist
where POSITION = 1
group by PRODUCTCODE;

commit;

-- Question 7

select USERID, sum(PRICE)
from orders
group by USERID
order by USERID;

commit;

-- Question 8

select PURCHASEDATE, sum(PRICE) as PROFIT
from orders
group by PURCHASEDATE
order by PROFIT desc;

commit;

-- Question 9

select PRODUCTCODE, TOTAL_HOURS
from (select PRODUCTCODE,
    sum(HOURSPLAYED) as TOTAL_HOURS
    from USERLIBRARY
    group by PRODUCTCODE
    order by TOTAL_HOURS desc)
where rownum <= 5;

commit;

-- Question 10

create view infractions_view as
select USERID, count(INFRACTIONID) as INFRACTIONS_RECEIVED
from INFRACTIONS
group by USERID
order by INFRACTIONS_RECEIVED desc;

commit;

-- Question 11

create view repeat_offenders as
select USERID, RULENUM, count(RULENUM) as TIMES_OFFENDED
from INFRACTIONS
group by USERID, RULENUM;

select *
from repeat_offenders
order by USERID;

commit;

-- Question 12

select RULENUM, PENALTY, count(PENALTY) as TIMES_ASSIGNED
from INFRACTIONS
group by RULENUM, PENALTY;

commit;

-- Question 13

select avg((DATEUPDATED - DATESUBMITTED) * 24) as AVG_HOURS,
    max((DATEUPDATED - DATESUBMITTED) * 24) as MAX_HOURS,
    min((DATEUPDATED - DATESUBMITTED) * 24) as MIN_HOURS
from USERSUPPORT
where STATUS = 'CLOSED';

commit;

-- Question 14

select EMAIL, ISSUE, count(ISSUE) as NUMBER_OF_TICKETS
from USERSUPPORT
where STATUS = 'NEW'
group by DATESUBMITTED
order by NUMBER_OF_TICKETS;

commit;

-- Question 15

select FIRSTNAME, LASTNAME, USERNAME
from USERBASE
where PASSWORD like '%' || FIRSTNAME || '%' or PASSWORD like '%' || LASTNAME || '%';

commit;

-- Question 16

select PUBLISHER, avg(PRICE) as AVERAGE_PRICE
from PRODUCTLIST
group by PUBLISHER
order by PUBLISHER;

commit;

-- Question 17

create view 5_year_sale as
select PRODUCTNAME, (PRICE * 0.75) as SALE_PRICE, RELEASEDATE
from PRODUCTLIST
where RELEASEDATE <= date '2020-08-16';

commit;

-- Question 18

select GENRE, max(PRICE) as MAX_PRICE, min(PRICE) as MIN_PRICE
from PRODUCTLIST
group by GENRE;

commit;

-- Question 19

create view last_week_messages as
select *
from CHATLOG
where DATASENT between date '2025-08-09' and date '2025-08-16';

commit;

-- Question 20

create view monthly_infraction_log as
select USERID, DATEASSIGNED, PENALTY
from INFRACTIONS
where PENALTY is not null and DATEASSIGNED >= date '2025-07-16';

commit;