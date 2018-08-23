
/* Drop Tables */

DROP TABLE replay CASCADE CONSTRAINTS;
DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE buy CASCADE CONSTRAINTS;
DROP TABLE chat CASCADE CONSTRAINTS;
DROP TABLE icon CASCADE CONSTRAINTS;
DROP TABLE report CASCADE CONSTRAINTS;
DROP TABLE visitor CASCADE CONSTRAINTS;
DROP TABLE user CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE board
(
	bnum number(10,0) NOT NULL,
	title varchar2(200),
	content clob,
	hit number(7,0),
	recomm number(10,0),
	regdate date,
	id varchar2(30) NOT NULL,
	PRIMARY KEY (bnum)
);


CREATE TABLE buy
(
	buyNum number(7,0) NOT NULL,
	id varchar2(30) NOT NULL,
	inum number(4,0) NOT NULL,
	regdate date,
	expireday date,
	PRIMARY KEY (buyNum)
);


CREATE TABLE chat
(
	cNum number(19,0) NOT NULL,
	id varchar2(30) NOT NULL,
	regdate date,
	content clob,
	check number(2,0),
	PRIMARY KEY (cNum)
);


CREATE TABLE icon
(
	inum number(4,0) NOT NULL,
	price number(7,0),
	name varchar2(30),
	PRIMARY KEY (inum)
);


CREATE TABLE replay
(
	rnum number(10,0) NOT NULL,
	content clob,
	regdate date,
	recom number(7,0),
	id varchar2(30) NOT NULL,
	bnum number(10,0) NOT NULL,
	PRIMARY KEY (rnum)
);


CREATE TABLE report
(
	rnum  NOT NULL,
	content clob,
	id varchar2(30) NOT NULL,
	id varchar2(30) NOT NULL,
	PRIMARY KEY (rnum)
);


CREATE TABLE user
(
	id varchar2(30) NOT NULL,
	pwd varchar2(30) NOT NULL,
	email varchar2(30) NOT NULL UNIQUE,
	nic varchar2(80) NOT NULL UNIQUE,
	class varchar2(20),
	point number(10,0),
	PRIMARY KEY (id)
);


CREATE TABLE visitor
(
	vnum  NOT NULL,
	content clob,
	secret number(2,0),
	writer varchar2(30) NOT NULL,
	receiver varchar2(30) NOT NULL,
	PRIMARY KEY (vnum)
);



/* Create Foreign Keys */

ALTER TABLE replay
	ADD FOREIGN KEY (bnum)
	REFERENCES board (bnum)
;


ALTER TABLE buy
	ADD FOREIGN KEY (inum)
	REFERENCES icon (inum)
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE buy
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE chat
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE replay
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE report
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE report
	ADD FOREIGN KEY (id)
	REFERENCES user (id)
;


ALTER TABLE visitor
	ADD FOREIGN KEY (writer)
	REFERENCES user (id)
;


ALTER TABLE visitor
	ADD FOREIGN KEY (receiver)
	REFERENCES user (id)
;



