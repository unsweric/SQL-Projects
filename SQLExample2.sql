--����������Ϊ�գ������ظ�
create table gsyg
(bianhao int primary key,
xingming nvarchar(10),
nianling int 
)

insert into gsyg values(1,'���',30)
insert into gsyg values(4,'�˽�',26)
insert into gsyg (bianhao,xingming) values(3,'ɳɮ') --���벿���ֶΣ����������У�

select * from gsyg

update gsyg set nianling=200 where nianling=26
update gsyg set xingming='��ɮ', nianling=20 where bianhao=1
update gsyg set xingming='���' where nianling is null


delete from gsyg  where nianling=23 or xingming='���'

--���ֻ��ָ��������������Ҫһ��

create database shuihu

drop table bumen
drop table renwu

create table bumen
(  bianhao int primary key,
   mingcheng nvarchar(5),
   didian nvarchar(5)
 )
 
 create table renwu 
(  paihang int primary key,
   xingming nvarchar(5),
   zhiwu nvarchar(5),
   shangji int,
   ruzhishijian datetime,
   gongzi numeric(7,2),
   buzhu numeric(7,2),
   bianhao int foreign key references bumen(bianhao)
   )
   
insert into bumen values(1,'��ͷ��','������')
insert into bumen values(2,'��ְ','ǰɽ')
insert into bumen values(3,'���','��ɽ')
insert into bumen values(4,'����','��ɽ')
insert into bumen values(5,'ˮ��','ɽ��')
insert into bumen values(6,'����','��ɽ')


insert into renwu (paihang,xingming,zhiwu,ruzhishijian,gongzi,buzhu,bianhao)  values(101,'�ν�','կ��','2002-03-15',20000,3000,1)--��Ӳ�������
insert into renwu  values(102,'¬����','կ��',101,'2002-06-16',18000,3000,1)
insert into renwu  values(103,'����','��ʦ',101,'2002-08-19',17000,2800,2)
insert into renwu  values(104,'����ʤ','��ʦ',103,'2002-09-22',16000,2600,2)
insert into renwu  values(105,'��ʤ','��',102,'2003-02-15',15000,2300,3)
insert into renwu  (paihang,xingming,zhiwu,shangji,ruzhishijian,gongzi,bianhao)values(106,'����','С��',105,'2005-07-09',14000,3)
insert into renwu  values(107,'³����','��',102,'2003-04-22',13000,2000,4)
insert into renwu  values(108,'����','��',107,'2003-09-18',12000,1800,4)
insert into renwu  (paihang,xingming,zhiwu,shangji,ruzhishijian,gongzi,bianhao)values(109,'����','С��',107,'2005-04-11',10000,4)
insert into renwu  values(110,'�','��',102,'2005-01-16',13000,3000,5)
insert into renwu  (paihang,xingming,zhiwu,shangji,ruzhishijian,gongzi,bianhao)values(111,'��С��','С��',110,'2005-06-24',13000,5)
insert into renwu  (paihang,xingming,zhiwu,shangji,ruzhishijian,gongzi,bianhao)values(112,'��С��','С��',110,'2005-06-15',12000,5)
insert into renwu  values(113,'���','�ܹ�',101,'2004-03-5',11000,1000,6)
insert into renwu  values(114,'��Ӣ','�ܹ�',113,'2006-03-10',10000,600,6)
insert into renwu  (paihang,xingming,zhiwu,shangji,ruzhishijian,gongzi,bianhao)values(115,'ʱǨ','Сͷ��',113,'2007-11-19',8000,6)


delete from renwu
delete from bumen
select * from renwu
select * from bumen

--1������³����Ĺ��ʣ����������ڲ��ŵı��
select xingming,gongzi,zhiwu,bianhao from renwu where xingming='³����'

--2,��ѯһ���ж��ٸ�����
select distinct bianhao from renwu
select distinct bianhao,shangji from renwu

--3,��ʾÿ��Ա������н���Ұ��ֶ���Ϊ\���ķ�ʽ��ʾ
select xingming ����,gongzi*12 ������ from renwu

--4������������  �Ϳ�ֵ����������
select xingming ����,gongzi*12+isnull(buzhu,0)*12 '��������' from renwu

--5����2004��1��1���Ժ���ְ��Ա��
select xingming ����,ruzhishijian '��ְʱ��' from renwu where ruzhishijian >'2004-1-1'

--6���ҹ�����13000��18000��Ա��
select xingming ����,gongzi '����' from renwu where gongzi>13000 and gongzi<=18000

--7��ѯ�����Ա��     ��ѯ�ڶ������ǿ���Ա��
select xingming ���� from renwu where xingming like '��%' --%��ʾ0�����ַ���_��ʾһ���ַ�
select xingming ���� from renwu where xingming like '_��%'

--8������ѯ
select xingming ����,gongzi '����',paihang from renwu where paihang in (101,105,108,114)

--9��ʾһ���ֵ�������ְ��
select xingming ����,zhiwu from renwu where shangji is null

--10���� Ĭ������ desc���� ����������ƴ��˳�������
select xingming ����,zhiwu,gongzi from renwu order by gongzi desc
select xingming ���� from renwu order by xingming

--11�����ű������Ȼ�󰴹��ʽ���
select xingming ����,bianhao,gongzi from renwu order by bianhao,gongzi desc

--12������ʱ���ķ����������벢��������
select xingming ����, gongzi*12+isnull(buzhu,0)*12 from renwu order by gongzi*12+isnull(buzhu,0)*12 desc
select xingming ����, gongzi*12+isnull(buzhu,0)*12 '��н' from renwu order by ��н desc

--13��ʾ��߹��ʺ���͹���
`
select min(gongzi) from renwu

--14��ʾ�ܹ��ʺ�ƽ������
select sum(gongzi)'�ܹ���',avg(gongzi)'ƽ������' from renwu 
select xingming,gongzi from renwu where gongzi=(select max(gongzi) from renwu)

--15��ʾ����ƽ�����ʵ�Ա���������͹���
select xingming,gongzi from renwu where gongzi>(select avg(gongzi) from renwu )
select xingming,gongzi,(select avg(gongzi) from renwu ) ƽ������ from renwu where gongzi>(select avg(gongzi) from renwu )
select xingming,111 from renwu 

--16ͳ���ж��ټ�¼
select count(*) from renwu where gongzi >10000

--17ͳ��ÿ�����ŵ�ƽ�����ʺ��ܹ��� --group by ������ֶα����������ʾ�ֶ���
select bianhao, avg(gongzi),sum(gongzi) from renwu group by bianhao

--18��ʾÿ������ÿ��ְ���ƽ�����ʺ���͹���
select bianhao, avg(gongzi),min(gongzi),zhiwu from renwu group by bianhao,zhiwu order by bianhao

--19��ʾƽ�����ʵ���15000�Ĳ��ű�ź�ƽ������-����һ�������
select bianhao, avg(gongzi) from renwu group by bianhao having avg(gongzi)<15000

--20

