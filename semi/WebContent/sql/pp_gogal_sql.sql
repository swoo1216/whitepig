--USER
DROP TABLE GUSER;
CREATE TABLE GUSER(
	ID VARCHAR2(30)	CONSTRAINT GU_ID_PK PRIMARY KEY,
	PWD VARCHAR2(30) NOT NULL,
	EMAIL VARCHAR2(30) NOT NULL CONSTRAINT GU_EMAIL_UK UNIQUE,
	NIC VARCHAR2(80) NOT NULL CONSTRAINT GU_NIC_UK UNIQUE,
	CLSS VARCHAR2(20), --CONSTRAINT GU_CLASS_CC CHECK(IN('ADMIN', 'REGULAR')),
	POINT NUMBER(10)
	--NUM NUMBER(4) GU_NUM_FK REFERENCES ICON(num) ON DELETE CASCADE
);

drop table icon;
create table icon
(
	num number(5) primary key,
	inum number(5)
);

insert into icon values(1, 1);

alter table gUser
add num CONSTRAINT GU_NUM_FK REFERENCES ICON(num) ON DELETE CASCADE;

INSERT INTO GUSER VALUES('aaa', '123', 'aaa@bbb.com', 'Alvin', NULL, 10000, 1);
INSERT INTO GUSER VALUES('bbb', '123', 'bbb@bbb.com', 'Chris', NULL, 10000, 1);

--TABLENAMES
DROP TABLE TNAMES;
CREATE TABLE TNAMES
(
	TNUM NUMBER(5) CONSTRAINT GT_TNUM_PK PRIMARY KEY,
	TNAME VARCHAR(30) CONSTRAINT GT_TNAME_UU UNIQUE
);

insert into tnames values(0, 'Gboard');

--BOARD
DROP TABLE GBOARD;
CREATE TABLE GBOARD(
	BNUM NUMBER(10) CONSTRAINT GB_BNUM_PK PRIMARY KEY,
	TITLE VARCHAR2(200),
	CONTENT	VARCHAR2(1000),
	HIT	NUMBER(7),
	RECOMM NUMBER(10),
	ID VARCHAR2(30)
	REGDATE	DATE
);

--COMMENT
--DROP TABLE GCOMMENT;
--CREATE TABLE GCOMMENT(
--	CNUM NUMBER(10) CONSTRAINT GC_RNUM_PK PRIMARY KEY,
--	CONTENT VARCHAR2(1000),
--	RECOMM NUMBER(7),
--	ID VARCHAR2(30) CONSTRAINT GC_ID_FK REFERENCES GUSER(ID) ON DELETE CASCADE,
--	BNUM NUMBER(10) CONSTRAINT GC_BNUM_FK REFERENCES GBOARD(BNUM) ON DELETE CASCADE,
--	REGDATE DATE
--);

-- new Comment

DROP TABLE GCOMMENT;
CREATE TABLE GCOMMENT(
	CNUM NUMBER(10) CONSTRAINT GC_RNUM_PK PRIMARY KEY,
	BNUM NUMBER(10) CONSTRAINT GC_BNUM_FK REFERENCES GBOARD(BNUM) ON DELETE CASCADE,
	TNUM NUMBER(5) CONSTRAINT GC_TNUM_FK REFERENCES TNAMES(TNUM) ON DELETE CASCADE, -- new
	CONTENT VARCHAR2(1000),
	RECOMM NUMBER(7),
	NIC VARCHAR2(80), -- new
	PWD VARCHAR2(30), -- new
	ID VARCHAR2(30) CONSTRAINT GC_ID_FK REFERENCES GUSER(ID) ON DELETE CASCADE,
	REGDATE DATE
);

--RECOMMTABLE
DROP TABLE GRECOMMTABLE;
CREATE TABLE GRECOMMTABLE
(
	RENUM NUMBER(10) CONSTRAINT RT_RENUM_PK PRIMARY KEY,
	ID VARCHAR2(30) CONSTRAINT RT_ID_FK REFERENCES GUSER(ID) ON DELETE CASCADE,
	BNUM NUMBER(10) CONSTRAINT RT_BNUM_FK REFERENCES GBOARD(BNUM) ON DELETE CASCADE,
	TNUM NUMBER(5) CONSTRAINT RT_TNUM_FK REFERENCES TNAMES(TNUM) ON DELETE CASCADE
);


CREATE TABLE PANTALK
(
	PANNUM NUMBER(10) CONSTRAINT PAN_PANNUM_PK PRIMARY KEY,
	SENDER VARCHAR2(30),
	RECEIVER VARCHAR2(30),
	CONTENT VARCHAR2(1000),
	SENDDATE DATE,
	SENDOK NUMBER(2)
);

drop table report;
create table report
(
	reportNum Number(10) CONSTRAINT report_reportNum_PK PRIMARY KEY,
	reporter varchar2(30),
	suspect varchar2(30),
	rtype varchar2(20),
	content varchar2(1000)
);

create table gamescore
(
    gameNum number(5) primary key,
    id varchar2(30),
    getPoint number(10)
);

