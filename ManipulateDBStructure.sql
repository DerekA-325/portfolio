alter table PRODUCTLIST
add (PRICE number, DESCRIPTION varchar2(20));

commit;

update PRODUCTLIST a
set (PRICE, DESCRIPTION) = 
    (select b.PRICE, b.DESCRIPTION
    from STOREFRONT b
    where b.PRODUCT_ID = a.PRODUCT_ID);

commit;

drop table STOREFRONT;

commit;

create table CHATLOG 
    (
        CHATID number(3) constraint pk_chatlog_chatid primary key,
        RECEIVERID number(3) constraint fk_chatlog_receiverid references USERBASE(USERID),
        SENDERID number(3) constraint fk_chatlog_senderid references USERBASE(USERID),
        DATASENT date,
        CONTENT varchar2(250)
    );

commit;

insert all
    into CHATLOG (CHATID, RECEIVERID, SENDERID, DATASENT, CONTENT)
        values  (001, 102, 101, date '2025-08-10', 'Hello!')
    into CHATLOG (CHATID, RECEIVERID, SENDERID, DATASENT, CONTENT)
        values  (002, 101, 102, date '2025-08-10', 'Hey!')
    into CHATLOG (CHATID, RECEIVERID, SENDERID, DATASENT, CONTENT)
        values  (003, 102, 101, date '2025-08-10', 'Want to raid the dungeon tomorrow?')
    into CHATLOG (CHATID, RECEIVERID, SENDERID, DATASENT, CONTENT)
        values  (004, 101, 102, date '2025-08-10', 'Sure! I am free around 7.')
    into CHATLOG (CHATID, RECEIVERID, SENDERID, DATASENT, CONTENT)
        values  (005, 102, 101, date '2025-08-10', 'Works for me!')
    into CHATLOG (CHATID, RECEIVERID, SENDERID, DATASENT, CONTENT)
        values  (006, 102, 101, date '2025-08-10', 'See you then.')
    into CHATLOG (CHATID, RECEIVERID, SENDERID, DATASENT, CONTENT)
        values  (007, 103, 102, date '2025-08-10', 'I heard you are raiding tomorrow. Can I join?')
    into CHATLOG (CHATID, RECEIVERID, SENDERID, DATASENT, CONTENT)
        values  (008, 102, 103, date '2025-08-10', 'Of course! We are grouping up at 7.')
    into CHATLOG (CHATID, RECEIVERID, SENDERID, DATASENT, CONTENT)
        values  (009, 103, 102, date '2025-08-10', 'Okay I will see you there!')
    into CHATLOG (CHATID, RECEIVERID, SENDERID, DATASENT, CONTENT)
        values  (010, 102, 103, date '2025-08-10', 'Great!')
select * from dual;

commit;

create table FRIENDSLIST 
    (
        USERID number(3) constraint fk_friendslist_userid references USERBASE(USERID),
        FRIENDID number(3) constraint fk_friendslist_friendid references USERBASE(USERID),
        constraint pk_friendslist primary key (USERID, FRIENDID)
    );

commit;

insert all
    into FRIENDSLIST (USERID, FRIENDID)
        values  (101, 102)
    into FRIENDSLIST (USERID, FRIENDID)
        values  (101, 103)
    into FRIENDSLIST (USERID, FRIENDID)
        values  (102, 101)
    into FRIENDSLIST (USERID, FRIENDID)
        values  (101, 103)
    into FRIENDSLIST (USERID, FRIENDID)
        values  (103, 101)
    into FRIENDSLIST (USERID, FRIENDID)
        values  (103, 102)
    into FRIENDSLIST (USERID, FRIENDID)
        values  (101, 104)
    into FRIENDSLIST (USERID, FRIENDID)
        values  (104, 101)
    into FRIENDSLIST (USERID, FRIENDID)
        values  (102, 104)
    into FRIENDSLIST (USERID, FRIENDID)
        values  (104, 102)
select * from dual;

commit;

create table WISHLIST 
    (
        USERID number(3) 
            constraint fk_wishlist_userid
            references USERBASE(USERID),
        PRODUCTCODE varchar2(5)   
            constraint fk_wishlist_productcode
            references PRODUCTLIST(PRODUCTCODE),
        POSITION number(3),
        constraint pk_wishlist primary key (USERID, PRODUCTCODE)
    );

commit;

insert all
    into WISHLIST (USERID, PRODUCTCODE, POSITION)
        values  (101, 'GAME1', 001)
    into WISHLIST (USERID, PRODUCTCODE, POSITION)
        values  (101, 'GAME2', 002)
    into WISHLIST (USERID, PRODUCTCODE, POSITION)
        values  (102, 'GAME1', 003)
    into WISHLIST (USERID, PRODUCTCODE, POSITION)
        values  (102, 'GAME3', 004)
    into WISHLIST (USERID, PRODUCTCODE, POSITION)
        values  (102, 'GAME4', 005)
    into WISHLIST (USERID, PRODUCTCODE, POSITION)
        values  (103, 'GAME2', 006)
    into WISHLIST (USERID, PRODUCTCODE, POSITION)
        values  (104, 'GAME3', 007)
    into WISHLIST (USERID, PRODUCTCODE, POSITION)
        values  (104, 'GAME5', 008)
    into WISHLIST (USERID, PRODUCTCODE, POSITION)
        values  (104, 'GAME6', 009)
    into WISHLIST (USERID, PRODUCTCODE, POSITION)
        values  (104, 'GAME8', 010)    
select * from dual;

commit;

create table USERPROFILE
    (
        USERID number(3) 
            constraint fk_userprofile_userid
            references USERBASE(USERID),
        IMAGEFILE varchar2(250),
        DESCRIPTION varchar2(250),
        constraint pk_uerprofile primary key (USERID)
    );

commit;

insert all 
    into USERPROFILE (USERID, IMAGEFILE, DESCRIPTION)
        values (101, 'profilepic.png', 'My smiling face')
    into USERPROFILE (USERID, IMAGEFILE, DESCRIPTION)
        values (102, 'f34h21j5.jpg', 'profile picture')
    into USERPROFILE (USERID, IMAGEFILE, DESCRIPTION)
        values (103, 'pic00000001.png', 'Default picture')
    into USERPROFILE (USERID, IMAGEFILE, DESCRIPTION)
        values (104, 'pic00000001.png', 'Default picture')
    into USERPROFILE (USERID, IMAGEFILE, DESCRIPTION)
        values (105, 'file10023.png', 'My logo')
    into USERPROFILE (USERID, IMAGEFILE, DESCRIPTION)
        values (106, 'k4376fds8.png', 'Kermit the frog')
    into USERPROFILE (USERID, IMAGEFILE, DESCRIPTION)
        values (107, 'pic00000001.png', 'Default picture')
    into USERPROFILE (USERID, IMAGEFILE, DESCRIPTION)
        values (108, 'daisy.jpg', 'My dog Daisy')
    into USERPROFILE (USERID, IMAGEFILE, DESCRIPTION)
        values (109, 'frog_boat_lilypad.jpg', 'Picture of a pond I found online.')
    into USERPROFILE (USERID, IMAGEFILE, DESCRIPTION)
        values (110, 'selfie.png', 'Just a selfie')
select * from dual;

commit;

create table SECURITYQUESTION
    (
        QUESTIONID number constraint pk_securityquestion primary key,
        USERID number(3) constraint fk_securityquestion_userid references USERBASE(USERID),
        QUESTION varchar2(250),
        ANSWER varchar2(250)
    );

commit;

insert all
    into SECURITYQUESTION (QUESTIONID, USERID, QUESTION, ANSWER)
    values (1, 101, 'What is your mothers maiden name?', 'Robertson')
    into SECURITYQUESTION (QUESTIONID, USERID, QUESTION, ANSWER)
    values (2, 102, 'What is your mothers maiden name?', 'Johnson')
    into SECURITYQUESTION (QUESTIONID, USERID, QUESTION, ANSWER)
    values (3, 103, 'What is your mothers maiden name?', 'Philips')
    into SECURITYQUESTION (QUESTIONID, USERID, QUESTION, ANSWER)
    values (4, 104, 'What is your mothers maiden name?', 'Chavez')
    into SECURITYQUESTION (QUESTIONID, USERID, QUESTION, ANSWER)
    values (5, 105, 'What is your mothers maiden name?', 'Cho')
    into SECURITYQUESTION (QUESTIONID, USERID, QUESTION, ANSWER)
    values (6, 106, 'What is your mothers maiden name?', 'Smith')
    into SECURITYQUESTION (QUESTIONID, USERID, QUESTION, ANSWER)
    values (7, 107, 'What is your mothers maiden name?', 'Brown')
    into SECURITYQUESTION (QUESTIONID, USERID, QUESTION, ANSWER)
    values (8, 108, 'What is your mothers maiden name?', 'Pachinski')
    into SECURITYQUESTION (QUESTIONID, USERID, QUESTION, ANSWER)
    values (9, 109, 'What is your mothers maiden name?', 'Daniels')
    into SECURITYQUESTION (QUESTIONID, USERID, QUESTION, ANSWER)
    values (10, 110, 'What is your mothers maiden name?', 'Stevenson')
select * from dual;

commit;

create table COMMUNITYRULES
    (
        RULENUM number(3) constraint pk_communityrules primary key,
        TITLE varchar2(250),
        DESCRIPTION varchar2(250),
        SEVERITYPOINT number(4)
    );

commit;

insert all
    into COMMUNITYRULES (RULENUM, TITLE, DESCRIPTION, SEVERITYPOINT)
    values (001, 'Tolerance', 'No racism, sexism, homophobia, or any other form of bigotry allowed.', 9999)
    into COMMUNITYRULES (RULENUM, TITLE, DESCRIPTION, SEVERITYPOINT)
    values (002, 'Hate speech', 'No posting hateful content.', 9999)
    into COMMUNITYRULES (RULENUM, TITLE, DESCRIPTION, SEVERITYPOINT)
    values (003, 'Ban evasion', 'Evading punishment by creating a new account is forbidden.', 5000)
    into COMMUNITYRULES (RULENUM, TITLE, DESCRIPTION, SEVERITYPOINT)
    values (004, 'Cheating', 'No cheating through the use of third-party software or any other means.', 5000)
    into COMMUNITYRULES (RULENUM, TITLE, DESCRIPTION, SEVERITYPOINT)
    values (005, 'Harassment', 'No harrassing, stalking, or violating no-contact orders in any way.', 5000
    into COMMUNITYRULES (RULENUM, TITLE, DESCRIPTION, SEVERITYPOINT)
    values (006, 'Scamming', 'No manipulating others for personal gain.', 1000)
    into COMMUNITYRULES (RULENUM, TITLE, DESCRIPTION, SEVERITYPOINT)
    values (007, 'Third-Party Clients', 'Third-Party clients are allowed if they meet our guidelines.', 0001)
    into COMMUNITYRULES (RULENUM, TITLE, DESCRIPTION, SEVERITYPOINT)
    values (008, 'Gambling', 'No player-run games of chance allowed.', 0001)
    into COMMUNITYRULES (RULENUM, TITLE, DESCRIPTION, SEVERITYPOINT)
    values (009, 'Advertising', 'No advertising of any websites other than official VaporGames sites.', 0001)
    into COMMUNITYRULES (RULENUM, TITLE, DESCRIPTION, SEVERITYPOINT)
    values (010, 'Spamming', 'Try not to post too many messages in a short time.', 0001)
select * from dual;

commit;

create table INFRACTIONS
    (
        INFRACTIONID number constraint pk_infractions primary key,
        USERID number(3) constraint fk_infractions_userid references USERBASE(USERID),
        RULENUM number(3) constraint fk_infractions_rulenum references COMMUNITYRULES(RULENUM),
        DATEASSIGNED date,
        PENALTY varchar2(250)
    );

commit;

insert all
    into INFRACTIONS (INFRACTIONID, USERID, RULENUM, DATEASSIGNED, PENALTY)
    values (1, 101, 009, date '2025-08-06', 'Temporary mute (7 days)')
    into INFRACTIONS (INFRACTIONID, USERID, RULENUM, DATEASSIGNED, PENALTY)
    values (2, 102, 004, date '2025-08-07', 'Temporary ban (30 days)')
    into INFRACTIONS (INFRACTIONID, USERID, RULENUM, DATEASSIGNED, PENALTY)
    values (3, 103, 004, date '2025-08-07', 'Temporary ban (30 days)')
    into INFRACTIONS (INFRACTIONID, USERID, RULENUM, DATEASSIGNED, PENALTY)
    values (4, 104, 005, date '2025-08-07', 'Temporary ban 30 days)')
    into INFRACTIONS (INFRACTIONID, USERID, RULENUM, DATEASSIGNED, PENALTY)
    values (5, 105, 007, date '2025-08-08', 'Temporary ban (3 days)')
    into INFRACTIONS (INFRACTIONID, USERID, RULENUM, DATEASSIGNED, PENALTY)
    values (6, 106, 008, date '2025-08-08', 'Temporary ban (7 days)')
    into INFRACTIONS (INFRACTIONID, USERID, RULENUM, DATEASSIGNED, PENALTY)
    values (7, 107, 002, date '2025-08-09', 'Permanent ban')
    into INFRACTIONS (INFRACTIONID, USERID, RULENUM, DATEASSIGNED, PENALTY)
    values (8, 108, 003, date '2025-08-09', 'Permanent ban')
    into INFRACTIONS (INFRACTIONID, USERID, RULENUM, DATEASSIGNED, PENALTY)
    values (9, 109, 003, date '2025-08-09', 'Permanent ban')
    into INFRACTIONS (INFRACTIONID, USERID, RULENUM, DATEASSIGNED, PENALTY)
    values (10, 110, 010, date '2025-08-10', 'Temporary mute (1 days)')
select * from dual;

commit;

create table USERSUPPORT
    (
        TICKETID number constraint pk_usersupport primary key,
        EMAIL varchar2(250),
        ISSUE varchar2(250),
        DATESUBMITTED date,
        DATEUPDATED date,
        STATUS varchar2(250)
    );

commit;    

insert all
    into USERSUPPORT (TICKETID, EMAIL, ISSUE, DATESUBMITTED, DATEUPDATED, STATUS)
    values (1, 'fakeemail1@yahoo.com', 'Locked account', date '2025-07-10', date '2025-07-10', 'Closed')
    into USERSUPPORT (TICKETID, EMAIL, ISSUE, DATESUBMITTED, DATEUPDATED, STATUS)
    values (2, 'fakeemail2@yahoo.com', 'Ban appeal', date '2025-07-10', date '2025-07-11', 'Closed')
    into USERSUPPORT (TICKETID, EMAIL, ISSUE, DATESUBMITTED, DATEUPDATED, STATUS)
    values (3, 'fakeemail3@yahoo.com', 'Forgotten password', date '2025-07-10', date '2025-07-10', 'Closed')
    into USERSUPPORT (TICKETID, EMAIL, ISSUE, DATESUBMITTED, DATEUPDATED, STATUS)
    values (4, 'fakeemail4@yahoo.com', 'Forgotten password', date '2025-07-10', date '2025-07-10', 'Closed')
    into USERSUPPORT (TICKETID, EMAIL, ISSUE, DATESUBMITTED, DATEUPDATED, STATUS)
    values (5, 'fakeemail5@yahoo.com', 'Forgotten password', date '2025-07-12', date '2025-07-12', 'Closed')
    into USERSUPPORT (TICKETID, EMAIL, ISSUE, DATESUBMITTED, DATEUPDATED, STATUS)
    values (6, 'fakeemail6@yahoo.com', 'Forgotten password', date '2025-07-12', date '2025-07-12', 'Closed')
    into USERSUPPORT (TICKETID, EMAIL, ISSUE, DATESUBMITTED, DATEUPDATED, STATUS)
    values (7, 'fakeemail7@yahoo.com', 'Ban appeal', date '2025-07-13', date '2025-07-13', 'In progress')
    into USERSUPPORT (TICKETID, EMAIL, ISSUE, DATESUBMITTED, DATEUPDATED, STATUS)
    values (8, 'fakeemail8@yahoo.com', 'Ban appeal', date '2025-07-13', date '2025-07-14', 'In progress')
    into USERSUPPORT (TICKETID, EMAIL, ISSUE, DATESUBMITTED, DATEUPDATED, STATUS)
    values (9, 'fakeemail9@yahoo.com', 'Forgotten password', date '2025-07-14', date '2025-07-14', 'Closed')
    into USERSUPPORT (TICKETID, EMAIL, ISSUE, DATESUBMITTED, DATEUPDATED, STATUS)
    values (10, 'fakeemail10@yahoo.com', 'Locked account', date '2025-07-15', date '2025-07-15', 'New')
select * from dual;

commit;

create view unique_questions as
select unique QUESTION
from SECURITYQUESTION;

commit;

create view tickets_view as
select TICKETID, EMAIL, ISSUE, DATEUPDATED
from USERSUPPORT
where STATUS = 'New' or STATUS = 'In progress'
order by DATEUPDATED;

commit;