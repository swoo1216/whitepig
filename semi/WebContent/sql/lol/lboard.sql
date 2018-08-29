-- lboard.sql
CREATE TABLE lboard
(
	bnum number(10,0) NOT NULL,
	title varchar2(200),
	content varchar2(200),
	hit number(7,0),
	recomm number(10,0),
	id varchar2(30) NOT NULL,
	regdate date,
	PRIMARY KEY (bnum)
);

CREATE TABLE lcomment
(
	cnum number(10,0) NOT NULL,
	content varchar2(100),
	id varchar2(30) NOT NULL,
	bnum number(10,0) NOT NULL,
	regdate date,
	PRIMARY KEY (cnum)
);

CREATE TABLE lrecomm
(
	RENUM NUMBER(10,0) NOT NULL,
	ID VARCHAR2(30) NOT NULL,
	BNUM NUMBER(10,0) NOT NULL,
	PRIMARY KEY (RENUM)
);

ALTER TABLE lrecomm
	ADD FOREIGN KEY (bnum)
	REFERENCES lboard (bnum)
;


ALTER TABLE lcomment
	ADD FOREIGN KEY (bnum)
	REFERENCES lboard (bnum)
;