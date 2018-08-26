CREATE TABLE lolreply
(
	rnum number(10,0) NOT NULL,
	bnum number(10,0) NOT NULL,
	id varchar2(30) NOT NULL,
	content varchar2(100),
	recomm number(7,0),
	regdate varchar2(100),
	PRIMARY KEY (rnum)
);