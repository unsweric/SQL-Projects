--备份 还原
create database sss
backup database sss to disk='e:/sssnew.bak'
drop database sss
restore database sss from disk='e:/sssnew.bak'