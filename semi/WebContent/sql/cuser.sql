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