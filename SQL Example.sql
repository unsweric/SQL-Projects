--��ע�͵���˼   д����ʱע���ʽ��ƴд 
--�½����ݿ�     �����ִ�Сд
create database shuguo

--�����ͬʱ���ֶ�
create table renwu 
(  bianhao int,
   xingming nvarchar(5),
   xingbie nchar(1),
   zhiwu nvarchar(10),
   nianling int,
   gongzi numeric(7,2)--��7λ,С��ռ2λ    
)--��Ҫ�����ֶο��������ϳ����ڼ�

--ɾ��������ݿ�
drop table renwu

--��ѯ���
select * from renwu
select bianhao,gongzi from renwu
select bianhao,xingming,gongzi from renwu where gongzi>7000

--���ֶ�ȡ����
select bianhao ���,gongzi ���� from renwu

--��Ӽ�¼
insert into renwu values(1,'����','��','����',40,10000)
insert into renwu (bianhao,xingming,xingbie,zhiwu)  values(2,'�ʷ���','Ů','����')--��Ӳ�������
insert into renwu values(3,'�����','��','��ʦ',30,8000)
insert into renwu values(4,'����','��','����',37,6000)
insert into renwu values(5,'�ŷ�','��','����',35,5000)
insert into renwu values(5,'����','��','����',35,6000)

--ɾ����¼ 
delete from renwu  --deleteֻɾ����¼����ɾ���ֶ�/dropɾ��������
delete from renwu where bianhao=2

--�޸ļ�¼ �ѹ��ʵ���8000���˼���2%
update renwu set gongzi=gongzi*1.02 where gongzi<8000