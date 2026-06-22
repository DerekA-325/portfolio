-- Derek Avery

commit;

-- Question 1

Select USER_ID, USERNAME, CREATED, PASSWORD_CHANGE_DATE
From USER_USERS;

commit;

-- Question 2

Select *
From USER_TABLES;

commit;

-- Question 3

DESCRIBE ORDERS; 
DESCRIBE PRODUCTLIST; 
DESCRIBE REVIEWS; 
DESCRIBE STOREFRONT; 
DESCRIBE USERBASE;
DESCRIBE USERLIBRARY;

commit;

-- Question 4

Select *
From ORDERS, PRODUCTLIST, REVIEWS, STOREFRONT, USERBASE, USERLIBRARY;

commit;

-- Question 5

Select TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS
From USER_CONSTRAINTS;

commit;

-- Question 6

Select VIEW_NAME, TEXT
from USER_VIEWS;

commit;

-- Question 7

Select USERNAME
from UserBase
Order by USERNAME;

commit;

--Question 8

SELECT FIRSTNAME, LASTNAME, USERNAME, PASSWORD, EMAIL
from UserBase
Where EMAIL like '%@yahoo.com';

commit;

-- Question 9

Select USERNAME, BIRTHDAY, WALLETFUNDS
from UserBase
where WALLETFUNDS < 25;

commit;

-- Question 10

SELECT USERID, PRODUCTCODE
from UserLibrary
where HOURSPLAYED > 100;

commit;

-- Question 11

Select PRODUCTCODE
from UserLibrary
where HOURSPLAYED < 10;

commit;

-- Question 12

Select unique PUBLISHER
from ProductList;

commit;

-- Question 13

Select PRODUCTNAME, RELEASEDATE, PUBLISHER, GENRE
from ProductList
Order by GENRE;

commit;

-- QUestion 14

Select PRODUCTCODE, PUBLISHER
from PRODUCTLIST
where GENRE = 'Strategy';

commit;

-- Question 15

SELECT PRODUCTCODE, DESCRIPTION, PRICE
From STOREFRONT
Where Price > 25
Order by price desc;

commit;

-- Question 16

Select INVENTORYID, PRICE
from STOREFRONT
Order by PRICE;

commit;

-- Question 17

Select PRODUCTCODE, REVIEW
from REVIEWS
where RATING = 1;

commit;

-- Question 18

Select PRODUCTCODE, REVIEW
from REVIEWS
where RATING >= 4;

commit;

-- Question 19

SELECT Unique USERID
From Orders;

commit;

-- Question 20

Select *
From Orders
Order by Purchasedate;

commit;