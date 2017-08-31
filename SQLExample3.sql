笛卡尔集现象
select * from renwu,bumen
select * from renwu,bumen where renwu.bianhao=bumen.bianhao
select * from renwu,bumen where bumen.mingcheng='水军'
select * from renwu,bumen where bumen.mingcheng='水军' and renwu.bianhao=bumen.bianhao

--显示姓名和所在部门以及部门编号
select xingming,mingcheng,renwu.bianhao from renwu,bumen where  renwu.bianhao=bumen.bianhao

--显示部门号为4的部门名称,职工姓名和工资
select xingming,mingcheng,gongzi from renwu,bumen where  (renwu.bianhao=bumen.bianhao) and (bumen.bianhao=4)

--显示员工名,部门名和工资,并按部门编号排序
select xingming,mingcheng,gongzi from renwu,bumen where  (renwu.bianhao=bumen.bianhao) order by bumen.bianhao

--显示李逵的上级
select shangji from renwu where  xingming='李逵'
select xingming from renwu where paihang=(select shangji from renwu where  xingming='李逵')

--显示所有员工及其上级的姓名(自连接查询)
select a.xingming'姓名',b.xingming '上级' from renwu a,renwu b where  a.shangji=b.paihang

--子查询（嵌套查询）单行子查询：返回结果为单行的子查询成为单行子查询
--显示与鲁智深同部门的员工
select xingming from renwu where bianhao=(select bianhao from renwu where  xingming='鲁智深')

--子查询（嵌套查询）多行子查询：返回结果为多行的子查询成为多行子查询
--返回和5号部门相同职务的员工姓名,工资和部门编号
--多行子查询如果不能一次写对,就写两行 先写子查询再写主查询
select xingming,gongzi,bianhao from renwu where zhiwu in
(select distinct zhiwu from renwu where bianhao=5) and (bianhao!=5)

--显示高于部门平均工资的员工姓名和工资,部门编号以及部门的平均工资
--1,得到每个部门的平均工资
select avg(gongzi),bianhao from renwu group by bianhao 

select xingming,gongzi,pjgz,renwu.bianhao from renwu,(select avg(gongzi) pjgz,bianhao from renwu group by bianhao) lsb
where (renwu.bianhao=lsb.bianhao) and (renwu.gongzi>lsb.pjgz)


--分页查询
--显示第1个到第5个入职的员工
select top 5 xingming,zhiwu,ruzhishijian from renwu order by ruzhishijian

--显示第6个到第13个入职的员工
select top 8 xingming,ruzhishijian from renwu where paihang not in 
(select top 5 paihang from renwu order by ruzhishijian) order by ruzhishijian


--删除重复记录
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

--内连接与外连接
--内连接
select a.xingming'姓名',b.xingming'上级' from renwu a,renwu b where a.shangji=b.paihang
--左外连接:left左边的表全都显示
select a.xingming'姓名',b.xingming'上级' from renwu a left join renwu b on a.shangji=b.paihang
--右外连接:right右边的表全都显示
select a.xingming'姓名',b.xingming'上级' from renwu a right join renwu b on a.shangji=b.paihang


--约束 保证数据满足应有的条件
--约束分为 not null   unique(不能重复，有且最多能有一个null)    primary key（不能重复，不能有null）   foreign key    check  
create table biao
    ( dbbh int primary key,
     dbxm varchar(20) unique,
     dbmm varchar(20) not null,
     nianling int )

select * from biao 

insert into biao (dbxm,dbmm) values('贾宝玉','jiabaoyu') 


create table dabiao
    ( dbbh int ,
     dbxm varchar(20),
     nianling int check (nianling>=20 and nianling<=30) )

select * from dabiao 
drop table dabiao

insert into dabiao values(1,'贾宝玉',25) 

--default 默认 在不写数据的情况下采用已定义好的默认值, default可以单独使用,和约束没有配套关系
create table dabiao
    ( dbbh int ,
     nianling int check (nianling>=18 and nianling<=80) default 18 )
     
select * from dabiao 
drop table dabiao

insert into dabiao (dbbh) values(1001) 
insert into dabiao values(1001,25) 
insert into dabiao values(1001,30) 