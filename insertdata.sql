
insert into MajorInfo(majorno, mname, deptno, dname)
select 12201,'人工智能',122,'计算机科学与技术' union
select 12202,'软件工程',122,'计算机科学与技术' union
select 12301,'经济学',123,'商学院' union
select 12302,'金融学',123,'商学院' union
select 12303,'保险学',123,'商学院' union
select 12401,'量子力学',124,'物理学院' union
select 12402,'理论物理',124,'物理学院' union
select 12501,'英语',125,'外国语学院' union
select 12502,'法语',125,'外国语学院' union
select 12503,'阿拉伯语',125,'外国语学院' union
select 12504,'语言文化',125,'外国语学院'


insert into UserInfo(id, password, role)
select '101220088','000000',2 union
select '101220003','000000',2 union
select '101230123','000000',2 union
select '101240027','000000',2 union
select '101250094','000000',2 union
select '122001','000000',1 union
select '123001','000000',1 union
select '100000','000000',0


insert into StudentInfo(stuno, stuname, gender, majorno, admissiontime, teacherno, 
						culturednature, master_doctor, schoolrollstate, nationality,
						familyaddr, zip, homephone, telephone, email)
select '101220088','苗园','女','12201','20100901','122010','学术','master','1','中国大陆','','','','','' union
select '101240027','黄真川','男','12501','20100901','125013','学术','doctor','1','中国台湾','','','','',''


insert into TeacherInfo(tno, tname, gender, majorno, title, remark)
select '122001','尹晓红','女','122','行政人员','' union
select '122010','陈道蓄','男','122','博导','' union
select '122011','周志华','男','122','博导','' union
select '123001','张默然','女','123','行政人员','' union
select '125013','李俊','男','125','教授',''


insert into CourseInfo(cno, cname, tno, classTime, startweek, endweek,
						classroom, numofelec, classtype, credit)
select '0030001','计算思维导论','122010','周四7-8节',1,17,'仙I-107','200','通识','3' union
select '1220011','数据挖掘概论','122011','周三3-4节',1,17,'逸B-101','200','自选','2'





