create table MajorInfo
(	majorno int(5),
	mname varchar(30) not null,
	deptno int(3) not null,
	dname varchar(30) not null,
	primary key(majorno)
);


create table UserInfo
(	id varchar(9),/*需要登录界面处以正则表达式约束！*/
	password varchar(15) default '000000',
	role int(1) not null,
	primary key(id),
	/*0代表管理员，1代表教务员，2代表学生*/
	check (role = '0' or role = '1' or role = '2')
);


/*
	hobo，这里略去了一些你在接口里定义的属性，你对照一下再用
*/
create table StudentInfo
(	stuno char(9),/*这个如何建立约束？考虑到可能是inser语句插入，也可能是导入表。*/
	stuname varchar(20) not null,
	gender	char(2),
	majorno	int(3) not null,
	admissiontime date default getdate(), /*data类型怎么用？？*/
	teacherno int(10) not null,
	culturednature varchar(20) not null,
	master_doctor char(20) not null,
	schoolrollstate int(1) not null,
	nationality varchar(30),
	familyaddr varchar(50),
	zip varchar(6),
	homephone varchar(15),
	telephone varchar(15),
	email varchar(30),
	primary key(sno),
	foreign key (sno) references UserInfo(id),
	foreign key (majorno) references MajorInfo(majorno),
	foreign key (teacherno) references TeacherInfo(teacherno),
	check (gender = '男' or gender = '女'),
	check (culturednature = '学术' or culturednature = '专业'),
	check (master_doctor = 'master' or master_doctor = 'doctor'),
	check (schoolrollstate = '0' or schoolrollstate = '1')
);

/*
	如果上面的check不管用的话。。
	还有下面这种建立约束的方法可以试试。
*/
/*
create rule rule_sgender
as @gender in('男','女')
exec sp_bindrule 'rule_sgender', 'StudentInfo.gender'

create rule rule_sculturednature
as @culturednature in('学术','专业')
exec sp_bindrule 'rule_sculturednature', 'StudentInfo.culturednature'

create rule rule_smd
as @master_doctor in('master','doctor')
exec sp_bindrule 'rule_smd', 'StudentInfo.smd'

create rule rule_schoolrollstate
as @schoolrollstate in('0','1')
exec sp_bindrule 'rule_schoolrollstate', 'StudentInfo.schoolrollstate'

*/


/*
	同样的，和教师信息类中的数据域不太一样。
*/
create table TeacherInfo
( 	tno char(6),
	tname char(20) not null,
	gender varchar(2),
	deptno	int not null,
	title varchar(10),
	remark varchar(100),
	primary key(tno),
	check (gender = '男' or gender = '女')，
	check (title = '行政人员' or '讲师' or '副教授' or '教授' or '博导')
);


/*
	为了简化，删去了一些属性。
*/
create table CourseInfo
(	cno	char(7),
	cname varchar(40) not null,
	tno varchar(10),
	classTime varchar(20),
	startweek int(2) default '1',
	endweek int(2),
	classroom varchar(20),
	numofelec int(3),
	classtype varchar(10) not null,
	credit int(1) not null,
	primary key(cno),
	foreign key (tno) references TeacherInfo(tno),
	check (classtype = '通修' or classtype = '公选' or classtype = '必修' or classtype = '指选' or classtype = '自选')
);


create table CourseSelection
(	cno int,
	sno varchar(10),
	schoolyear int(4) not null,
	schoolterm int(1) not null,
	score int(3),
	primary key(cno, sno),
	foreign key (sno) references StudentInfo(sno),
	foreign key (cno) references CourseInfo(cno),
	check (schoolterm = '1' or schoolterm = '2'),
	check (score >= 0 && score <= 100)
);


/*
	插入数据
*/


