--pktable.sql
CREATE TABLE pktable
(
	tablenumber number(10,0) NOT NULL,
	tablename varchar2(30) NOT NULL,
	PRIMARY KEY (tablenumber)
);


create table icon
(
    num number(4) primary key,
    name varchar2(20),
    type varchar2(20),
    tier varchar2(20),
    price number(10)
);

create table inven
(
    inum number(4) primary key,
    id varchar2(30) REFERENCES cuser(id) on delete cascade,
    num number(4) REFERENCES icon(num) on delete cascade,
    regdate date
);

CREATE TABLE PBOARD(
	BNUM NUMBER(10) PRIMARY KEY,
	TITLE VARCHAR2(200),
	CONTENT	VARCHAR2(1000),
	HIT	NUMBER(7),
	RECOMM NUMBER(10),
	ID VARCHAR2(30) REFERENCES cUSER(ID) ON DELETE CASCADE,
	REGDATE	DATE
);

CREATE TABLE PCOMMENT(
	CNUM NUMBER(10) PRIMARY KEY,
	CONTENT VARCHAR2(1000),
	RECOMM NUMBER(7),
	ID VARCHAR2(30) REFERENCES cUSER(ID) ON DELETE CASCADE,
	BNUM NUMBER(10) REFERENCES pBOARD(BNUM) ON DELETE CASCADE,
	REGDATE DATE
);

CREATE TABLE pRECOMM
(
	RENUM NUMBER(10) PRIMARY KEY,
	ID VARCHAR2(30) REFERENCES cUSER(ID) ON DELETE CASCADE,
	BNUM NUMBER(10) REFERENCES pBOARD(BNUM) ON DELETE CASCADE
);

create table chat
(
    CHATNUM NUMBER(10) PRIMARY KEY,
    ID VARCHAR2(30) REFERENCES cUSER(ID) ON DELETE CASCADE,
    nic VARCHAR2(30),
    num number(4),
    content varchar2(100),
    regdate date
);



