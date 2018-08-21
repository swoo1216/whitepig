-- lolboard.sql
CREATE TABLE lolboard
(
	bnum number(10,0) NOT NULL,
	title varchar2(200),
	content varchar2(200),
	hit number(7,0),
	recomm number(10,0),
	regdate date,
	id varchar2(30) NOT NULL,
	PRIMARY KEY (bnum)
);
