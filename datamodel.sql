create table MajorInfo
(	specialityno int(5) not null,
	speciality varchar(30) not null,
	departmentno int(3) not null,
	department varchar(30) not null,
	primary key(specialityno)
);

create table UserInfo
(	id char(9),/*需要登录界面处以正则表达式约束！*/
	password varchar(15) default '000000',
	role int(1) not null,
	primary key(id),
	/*0代表管理员，1代表教务员，2代表学生*/
	check (role = '0' or role = '1' or role = '2')
);

create table TeacherInfo
( 	teacherno char(6),
	name varchar(20) not null,
	ename varchar(20),
	gender varchar(2),
	specialityno char(5) not null,
	title varchar(10),
	remark varchar(100),
	primary key(teacherno),
	foreign key (specialityno) references MajorInfo(specialityno),
	check (gender = '男' or gender = '女'),
	check (title in ('讲师' , '副教授' , '教授' , '博导'))
);

create table StudentInfo
(	stuno char(9),/*这个如何建立约束？考虑到可能是inser语句插入，也可能是导入表。*/
	stuname varchar(20) not null,
	pinyin varchar(30),
	gender	char(2),
	specialityno int(5) not null,
	admissiontime TIMESTAMP default CURRENT_TIMESTAMP,
	teacherno char(9),
	culturednature varchar(20) not null,
	master_doctor char(20) not null,
	schoolrollstate int(1) not null,
	nationality varchar(30),
	familyaddr varchar(80),
	zip varchar(6),
	stationname varchar(80),
	homephone varchar(15),
	phonenum varchar(15),
	email varchar(30),
	ethnicity varchar(10),
	personid  varchar(20) not null,
	graduatedate TIMESTAMP default CURRENT_TIMESTAMP,
	certificate_no char(15),
	primary key(stuno),
	foreign key (stuno) references UserInfo(id),
	/*can't add this FK-------don't know why*/
	foreign key (specialityno) references MajorInfo(specialityno),
	foreign key (teacherno) references TeacherInfo(teacherno),
	check (gender = '男' or gender = '女'),
	check (culturednature = '定向' or culturednature = '非定向'),
	check (master_doctor = 'master' or master_doctor = 'doctor'),
	check (schoolrollstate = '0' or schoolrollstate = '1')
);



/*
	为了简化，删去了一些属性。
*/
create table CourseInfo
(	courseno	char(7),
	coursename	varchar(20),
	ename	varchar(20),
	teacherno char(9),
	classroom varchar(20), 
	selcourseremark varchar(100),
	coursetime varchar(40),
	classno int(7),
	startweek int(2) default '1',
	endweek int(2),
	numofelec int(3),
	weekno int(2),
	grade char(4),
	isodd int(1),
	speciality varchar(20),
	schoolarea varchar(10),
	coursetype varchar(10) not null,
	credit int(1) not null,
	classhour int(2),
	subtype varchar(10),
	property varchar(10),
	primary key(courseno),
	foreign key (teacherno) references TeacherInfo(teacherno),
	check (coursetype in ('专业课', '公选课', '通识课'))
);

create table CourseSelection
(	courseno char(7),
	stuno char(9),
	schoolyear int(4) not null,
	schoolterm int(1) not null,
	grade int(3),
	remark varchar(100),
	primary key(cno, sno),
	foreign key (sno) references StudentInfo(stuno),
	foreign key (cno) references CourseInfo(cno),
	check (schoolterm = '1' or schoolterm = '2'),
	check (score >= 0 && score <= 100)
);


/*
	插入数据
*/


