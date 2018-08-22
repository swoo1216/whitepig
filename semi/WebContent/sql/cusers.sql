--cuser.sql
CREATE TABLE cuser
(
	id varchar2(30) NOT NULL,
	pwd varchar2(30) NOT NULL,
	email varchar2(30) NOT NULL UNIQUE,
	nic varchar2(80) NOT NULL UNIQUE,
	class varchar2(20),
	point number(10,0),
	PRIMARY KEY (id)
);