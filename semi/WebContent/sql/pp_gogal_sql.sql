--USER
DROP TABLE GUSER;
CREATE TABLE GUSER(
	ID VARCHAR2(30)	CONSTRAINT GU_ID_PK PRIMARY KEY,
	PWD VARCHAR2(30) NOT NULL,
	EMAIL VARCHAR2(30) NOT NULL CONSTRAINT GU_EMAIL_UK UNIQUE,
	NIC VARCHAR2(80) NOT NULL CONSTRAINT GU_NIC_UK UNIQUE,
	CLSS VARCHAR2(20), --CONSTRAINT GU_CLASS_CC CHECK(IN('ADMIN', 'REGULAR')),
	POINT NUMBER(10)
);

insert into guser values('aaa', '123', 'aaa@aaa.com', 'Micheal', null, 0);

--BOARD
DROP TABLE GBOARD;
CREATE TABLE GBOARD(
	BNUM NUMBER(10) CONSTRAINT GB_BNUM_PK PRIMARY KEY,
	TITLE VARCHAR2(200),
	CONTENT	VARCHAR2(1000),
	HIT	NUMBER(7),
	RECOMM NUMBER(10),
	ID VARCHAR2(30) CONSTRAINT GB_ID_FK REFERENCES GUSER(ID) ON DELETE CASCADE,
	REGDATE	DATE
);

