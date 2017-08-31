--是注释的意思   写程序时注意格式和拼写 
--新建数据库     不区分大小写
create database shuguo

--建表的同时建字段
create table renwu 
(  bianhao int,
   xingming nvarchar(5),
   xingbie nchar(1),
   zhiwu nvarchar(10),
   nianling int,
   gongzi numeric(7,2)--共7位,小数占2位    
)--若要增加字段可以在以上程序内加

--删除表或数据库
drop table renwu

--查询语句
select * from renwu
select bianhao,gongzi from renwu
select bianhao,xingming,gongzi from renwu where gongzi>7000

--给字段取别名
select bianhao 编号,gongzi 工资 from renwu

--添加记录
insert into renwu values(1,'刘备','男','主公',40,10000)
insert into renwu (bianhao,xingming,xingbie,zhiwu)  values(2,'甘夫人','女','夫人')--添加部分数据
insert into renwu values(3,'诸葛亮','男','军师',30,8000)
insert into renwu values(4,'关羽','男','将军',37,6000)
insert into renwu values(5,'张飞','男','将军',35,5000)
insert into renwu values(5,'赵云','男','将军',35,6000)

--删除记录 
delete from renwu  --delete只删除记录，不删除字段/drop删除整个表
delete from renwu where bianhao=2

--修改记录 把工资低于8000的人加上2%
update renwu set gongzi=gongzi*1.02 where gongzi<8000