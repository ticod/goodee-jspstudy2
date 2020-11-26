create table member (
   id varchar(20) primary key,
   pass varchar(20) not null,
   name varchar(20) not null,
   gender int(1),
   tel varchar(20),
   email varchar(100),
   picture varchar(200)
)