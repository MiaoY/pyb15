
insert into MajorInfo(majorno, mname, deptno, dname)
select 12201,'�˹�����',122,'�������ѧ�뼼��' union
select 12202,'�������',122,'�������ѧ�뼼��' union
select 12301,'����ѧ',123,'��ѧԺ' union
select 12302,'����ѧ',123,'��ѧԺ' union
select 12303,'����ѧ',123,'��ѧԺ' union
select 12401,'������ѧ',124,'����ѧԺ' union
select 12402,'��������',124,'����ѧԺ' union
select 12501,'Ӣ��',125,'�����ѧԺ' union
select 12502,'����',125,'�����ѧԺ' union
select 12503,'��������',125,'�����ѧԺ' union
select 12504,'�����Ļ�',125,'�����ѧԺ'


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
select '101220088','��԰','Ů','12201','20100901','122010','ѧ��','master','1','�й���½','','','','','' union
select '101240027','���洨','��','12501','20100901','125013','ѧ��','doctor','1','�й�̨��','','','','',''


insert into TeacherInfo(tno, tname, gender, majorno, title, remark)
select '122001','������','Ů','122','������Ա','' union
select '122010','�µ���','��','122','����','' union
select '122011','��־��','��','122','����','' union
select '123001','��ĬȻ','Ů','123','������Ա','' union
select '125013','�','��','125','����',''


insert into CourseInfo(cno, cname, tno, classTime, startweek, endweek,
						classroom, numofelec, classtype, credit)
select '0030001','����˼ά����','122010','����7-8��',1,17,'��I-107','200','ͨʶ','3' union
select '1220011','�����ھ����','122011','����3-4��',1,17,'��B-101','200','��ѡ','2'





