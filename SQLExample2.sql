--主键，不能为空，不能重复
create table gsyg
(bianhao int primary key,
xingming nvarchar(10),
nianling int 
)

insert into gsyg values(1,'悟空',30)
insert into gsyg values(4,'八戒',26)
insert into gsyg (bianhao,xingming) values(3,'沙僧') --插入部分字段（主键必须有）

select * from gsyg

update gsyg set nianling=200 where nianling=26
update gsyg set xingming='唐僧', nianling=20 where bianhao=1
update gsyg set xingming='悟空' where nianling is null


delete from gsyg  where nianling=23 or xingming='悟空'

--外键只能指向主键并且类型要一致

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
   
insert into bumen values(1,'总头领','聚义厅')
insert into bumen values(2,'文职','前山')
insert into bumen values(3,'马军','左山')
insert into bumen values(4,'步军','右山')
insert into bumen values(5,'水军','山下')
insert into bumen values(6,'后勤','后山')


insert into renwu (paihang,xingming,zhiwu,ruzhishijian,gongzi,buzhu,bianhao)  values(101,'宋江','寨主','2002-03-15',20000,3000,1)--添加部分数据
insert into renwu  values(102,'卢俊义','寨主',101,'2002-06-16',18000,3000,1)
insert into renwu  values(103,'吴用','军师',101,'2002-08-19',17000,2800,2)
insert into renwu  values(104,'公孙胜','军师',103,'2002-09-22',16000,2600,2)
insert into renwu  values(105,'关胜','大将',102,'2003-02-15',15000,2300,3)
insert into renwu  (paihang,xingming,zhiwu,shangji,ruzhishijian,gongzi,bianhao)values(106,'徐宁','小将',105,'2005-07-09',14000,3)
insert into renwu  values(107,'鲁智深','大将',102,'2003-04-22',13000,2000,4)
insert into renwu  values(108,'武松','大将',107,'2003-09-18',12000,1800,4)
insert into renwu  (paihang,xingming,zhiwu,shangji,ruzhishijian,gongzi,bianhao)values(109,'李逵','小将',107,'2005-04-11',10000,4)
insert into renwu  values(110,'李俊','大将',102,'2005-01-16',13000,3000,5)
insert into renwu  (paihang,xingming,zhiwu,shangji,ruzhishijian,gongzi,bianhao)values(111,'阮小二','小将',110,'2005-06-24',13000,5)
insert into renwu  (paihang,xingming,zhiwu,shangji,ruzhishijian,gongzi,bianhao)values(112,'阮小七','小将',110,'2005-06-15',12000,5)
insert into renwu  values(113,'柴进','总管',101,'2004-03-5',11000,1000,6)
insert into renwu  values(114,'李英','总管',113,'2006-03-10',10000,600,6)
insert into renwu  (paihang,xingming,zhiwu,shangji,ruzhishijian,gongzi,bianhao)values(115,'时迁','小头领',113,'2007-11-19',8000,6)


delete from renwu
delete from bumen
select * from renwu
select * from bumen

--1，搜索鲁智深的工资，工作和所在部门的编号
select xingming,gongzi,zhiwu,bianhao from renwu where xingming='鲁智深'

--2,查询一共有多少个部门
select distinct bianhao from renwu
select distinct bianhao,shangji from renwu

--3,显示每个员工的年薪并且把字段以为\中文方式显示
select xingming 姓名,gongzi*12 年收入 from renwu

--4计算年总收入  和空值做四则运算
select xingming 姓名,gongzi*12+isnull(buzhu,0)*12 '年总收入' from renwu

--5查找2004年1月1日以后入职的员工
select xingming 姓名,ruzhishijian '入职时间' from renwu where ruzhishijian >'2004-1-1'

--6查找工资在13000到18000的员工
select xingming 姓名,gongzi '工资' from renwu where gongzi>13000 and gongzi<=18000

--7查询姓李的员工     查询第二个字是俊的员工
select xingming 姓名 from renwu where xingming like '李%' --%表示0或多个字符，_表示一个字符
select xingming 姓名 from renwu where xingming like '_俊%'

--8批量查询
select xingming 姓名,gongzi '工资',paihang from renwu where paihang in (101,105,108,114)

--9显示一把手的姓名和职务
select xingming 姓名,zhiwu from renwu where shangji is null

--10排序 默认升序 desc降序 中文排序按照拼音顺序和音调
select xingming 姓名,zhiwu,gongzi from renwu order by gongzi desc
select xingming 姓名 from renwu order by xingming

--11按部门编号升序，然后按工资降序
select xingming 姓名,bianhao,gongzi from renwu order by bianhao,gongzi desc

--12用其临时名的方法算总收入并降序排列
select xingming 姓名, gongzi*12+isnull(buzhu,0)*12 from renwu order by gongzi*12+isnull(buzhu,0)*12 desc
select xingming 姓名, gongzi*12+isnull(buzhu,0)*12 '年薪' from renwu order by 年薪 desc

--13显示最高工资和最低工资
`
select min(gongzi) from renwu

--14显示总工资和平均工资
select sum(gongzi)'总工资',avg(gongzi)'平均工资' from renwu 
select xingming,gongzi from renwu where gongzi=(select max(gongzi) from renwu)

--15显示高于平均工资的员工的姓名和工资
select xingming,gongzi from renwu where gongzi>(select avg(gongzi) from renwu )
select xingming,gongzi,(select avg(gongzi) from renwu ) 平均工资 from renwu where gongzi>(select avg(gongzi) from renwu )
select xingming,111 from renwu 

--16统计有多少记录
select count(*) from renwu where gongzi >10000

--17统计每个部门的平均工资和总工资 --group by 后面的字段必须出现在显示字段中
select bianhao, avg(gongzi),sum(gongzi) from renwu group by bianhao

--18显示每个部门每个职务的平均工资和最低工资
select bianhao, avg(gongzi),min(gongzi),zhiwu from renwu group by bianhao,zhiwu order by bianhao

--19显示平均工资低于15000的部门编号和平均工资-排序一定在最后
select bianhao, avg(gongzi) from renwu group by bianhao having avg(gongzi)<15000

--20

