-- lolboard.sql
CREATE TABLE lolboard
(
	bnum number(10,0) NOT NULL,
	title varchar2(200),
	content varchar2(200),
	reply number(7,0),
	recomm number(10,0),
	hit number(7,0),
	id varchar2(30) NOT NULL,
	regdate varchar2(100),
	PRIMARY KEY (bnum)
);
