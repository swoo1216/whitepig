
/* Drop Tables */

DROP TABLE chat CASCADE CONSTRAINTS;
DROP TABLE grecomm CASCADE CONSTRAINTS;
DROP TABLE greply CASCADE CONSTRAINTS;
DROP TABLE gboard CASCADE CONSTRAINTS;
DROP TABLE inven CASCADE CONSTRAINTS;
DROP TABLE icon CASCADE CONSTRAINTS;
DROP TABLE lrecomm CASCADE CONSTRAINTS;
DROP TABLE lreply CASCADE CONSTRAINTS;
DROP TABLE lboard CASCADE CONSTRAINTS;
DROP TABLE mrecomm CASCADE CONSTRAINTS;
DROP TABLE mreply CASCADE CONSTRAINTS;
DROP TABLE mboard CASCADE CONSTRAINTS;
DROP TABLE pantalk CASCADE CONSTRAINTS;
DROP TABLE precomm CASCADE CONSTRAINTS;
DROP TABLE preply CASCADE CONSTRAINTS;
DROP TABLE pboard CASCADE CONSTRAINTS;
DROP TABLE report CASCADE CONSTRAINTS;
DROP TABLE score CASCADE CONSTRAINTS;
DROP TABLE user CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE chat
(
	id varchar2(30) NOT NULL
);


CREATE TABLE gboard
(
	gnum  NOT NULL,
	id varchar2(30) NOT NULL,
	PRIMARY KEY (gnum)
);


CREATE TABLE grecomm
(
	gnum  NOT NULL
);


CREATE TABLE greply
(
	gnum  NOT NULL
);


CREATE TABLE icon
(
	inum  NOT NULL,
	PRIMARY KEY (inum)
);


CREATE TABLE inven
(
	inum  NOT NULL,
	id varchar2(30) NOT NULL
);


CREATE TABLE lboard
(
	lnum  NOT NULL,
	id varchar2(30) NOT NULL,
	PRIMARY KEY (lnum)
);


CREATE TABLE lrecomm
(
	lnum  NOT NULL
);


CREATE TABLE lreply
(
	lnum  NOT NULL
);


CREATE TABLE mboard
(
	mnum  NOT NULL,
	id varchar2(30) NOT NULL,
	PRIMARY KEY (mnum)
);


CREATE TABLE mrecomm
(
	mnum  NOT NULL
);


CREATE TABLE mreply
(
	mnum  NOT NULL
);


CREATE TABLE pantalk
(
	id varchar2(30) NOT NULL
);


CREATE TABLE pboard
(
	pnum  NOT NULL,
	id varchar2(30) NOT NULL,
	PRIMARY KEY (pnum)
);


CREATE TABLE precomm
(
	pnum  NOT NULL
);


CREATE TABLE preply
(
	pnum  NOT NULL
);


CREATE TABLE report
(
	id varchar2(30) NOT NULL
);


CREATE TABLE score
(
	id varchar2(30) NOT NULL
);


CREATE TABLE cuser
(
	id varchar2(30) NOT NULL,
	pwd varchar2(30) NOT NULL,
	email varchar2(30) NOT NULL UNIQUE,
	nic varchar2(80) NOT NULL UNIQUE,
	clss varchar2(20),
	point number(10,0),
	regdate date,
	num number(4,0) NOT NULL,
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE grecomm
	ADD FOREIGN KEY (gnum)
	REFERENCES gboard (gnum)
;


ALTER TABLE greply
	ADD FOREIGN KEY (gnum)
	REFERENCES gboard (gnum)
;


ALTER TABLE inven
	ADD FOREIGN KEY (inum)
	REFERENCES icon (inum)
;


ALTER TABLE lrecomm
	ADD FOREIGN KEY (lnum)
	REFERENCES lboard (lnum)
;


ALTER TABLE lcomment
	ADD FOREIGN KEY (bnum)
	REFERENCES lboard (bnum)
;


ALTER TABLE mrecomm
	ADD FOREIGN KEY (mnum)
	REFERENCES mboard (mnum)
;


ALTER TABLE mreply
	ADD FOREIGN KEY (mnum)
	REFERENCES mboard (mnum)
;


ALTER TABLE precomm
	ADD FOREIGN KEY (pnum)
	REFERENCES pboard (pnum)
;


ALTER TABLE preply
	ADD FOREIGN KEY (pnum)
	REFERENCES pboard (pnum)
;


ALTER TABLE chat
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE gboard
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE inven
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE lboard
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE mboard
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE pantalk
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE pboard
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE report
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE score
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;



