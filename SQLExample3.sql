�ѿ���������
select * from renwu,bumen
select * from renwu,bumen where renwu.bianhao=bumen.bianhao
select * from renwu,bumen where bumen.mingcheng='ˮ��'
select * from renwu,bumen where bumen.mingcheng='ˮ��' and renwu.bianhao=bumen.bianhao

--��ʾ���������ڲ����Լ����ű��
select xingming,mingcheng,renwu.bianhao from renwu,bumen where  renwu.bianhao=bumen.bianhao

--��ʾ���ź�Ϊ4�Ĳ�������,ְ�������͹���
select xingming,mingcheng,gongzi from renwu,bumen where  (renwu.bianhao=bumen.bianhao) and (bumen.bianhao=4)

--��ʾԱ����,�������͹���,�������ű������
select xingming,mingcheng,gongzi from renwu,bumen where  (renwu.bianhao=bumen.bianhao) order by bumen.bianhao

--��ʾ���ӵ��ϼ�
select shangji from renwu where  xingming='����'
select xingming from renwu where paihang=(select shangji from renwu where  xingming='����')

--��ʾ����Ա�������ϼ�������(�����Ӳ�ѯ)
select a.xingming'����',b.xingming '�ϼ�' from renwu a,renwu b where  a.shangji=b.paihang

--�Ӳ�ѯ��Ƕ�ײ�ѯ�������Ӳ�ѯ�����ؽ��Ϊ���е��Ӳ�ѯ��Ϊ�����Ӳ�ѯ
--��ʾ��³����ͬ���ŵ�Ա��
select xingming from renwu where bianhao=(select bianhao from renwu where  xingming='³����')

--�Ӳ�ѯ��Ƕ�ײ�ѯ�������Ӳ�ѯ�����ؽ��Ϊ���е��Ӳ�ѯ��Ϊ�����Ӳ�ѯ
--���غ�5�Ų�����ְͬ���Ա������,���ʺͲ��ű��
--�����Ӳ�ѯ�������һ��д��,��д���� ��д�Ӳ�ѯ��д����ѯ
select xingming,gongzi,bianhao from renwu where zhiwu in
(select distinct zhiwu from renwu where bianhao=5) and (bianhao!=5)

--��ʾ���ڲ���ƽ�����ʵ�Ա�������͹���,���ű���Լ����ŵ�ƽ������
--1,�õ�ÿ�����ŵ�ƽ������
select avg(gongzi),bianhao from renwu group by bianhao 

select xingming,gongzi,pjgz,renwu.bianhao from renwu,(select avg(gongzi) pjgz,bianhao from renwu group by bianhao) lsb
where (renwu.bianhao=lsb.bianhao) and (renwu.gongzi>lsb.pjgz)


--��ҳ��ѯ
--��ʾ��1������5����ְ��Ա��
select top 5 xingming,zhiwu,ruzhishijian from renwu order by ruzhishijian

--��ʾ��6������13����ְ��Ա��
select top 8 xingming,ruzhishijian from renwu where paihang not in 
(select top 5 paihang from renwu order by ruzhishijian) order by ruzhishijian


--ɾ���ظ���¼
create table xiaobiao(
xbbh int,
xbxm varchar(10))

insert into xiaobiao values(1,'xb1')
insert into xiaobiao values(2,'xb2')


select * from xiaobiao 

select * from lsb

select distinct * into lsb from xiaobiao
delete from xiaobiao
insert into xiaobiao select * from lsb
drop table lsb

--��������������
--������
select a.xingming'����',b.xingming'�ϼ�' from renwu a,renwu b where a.shangji=b.paihang
--��������:left��ߵı�ȫ����ʾ
select a.xingming'����',b.xingming'�ϼ�' from renwu a left join renwu b on a.shangji=b.paihang
--��������:right�ұߵı�ȫ����ʾ
select a.xingming'����',b.xingming'�ϼ�' from renwu a right join renwu b on a.shangji=b.paihang


--Լ�� ��֤��������Ӧ�е�����
--Լ����Ϊ not null   unique(�����ظ��������������һ��null)    primary key�������ظ���������null��   foreign key    check  
create table biao
    ( dbbh int primary key,
     dbxm varchar(20) unique,
     dbmm varchar(20) not null,
     nianling int )

select * from biao 

insert into biao (dbxm,dbmm) values('�ֱ���','jiabaoyu') 


create table dabiao
    ( dbbh int ,
     dbxm varchar(20),
     nianling int check (nianling>=20 and nianling<=30) )

select * from dabiao 
drop table dabiao

insert into dabiao values(1,'�ֱ���',25) 

--default Ĭ�� �ڲ�д���ݵ�����²����Ѷ���õ�Ĭ��ֵ, default���Ե���ʹ��,��Լ��û�����׹�ϵ
create table dabiao
    ( dbbh int ,
     nianling int check (nianling>=18 and nianling<=80) default 18 )
     
select * from dabiao 
drop table dabiao

insert into dabiao (dbbh) values(1001) 
insert into dabiao values(1001,25) 
insert into dabiao values(1001,30) 