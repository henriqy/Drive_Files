create database projeto_pratico
default character set utf8
default collate utf8_general_ci;

use projeto_pratico;

show databases;

create table if not exists cliente(
cnh int not null primary key,
cartao varchar(40) not null unique,
nome varchar(80) not null
) default charset=utf8;

desc cliente;
drop table cliente;

create table if not exists agencia(
numAg int not null primary key,
end_cidade varchar(60),
end_rua varchar(15),
end_cep varchar(11),
end_num varchar(10)
) default charset = utf8;

create table if not exists carro(
placa varchar(15) not null primary key,
ano varchar(4) not null,  
modelo varchar(20) not null,
num_agencia int not null,
foreign key (num_agencia) references agencia(numAg)
) default charset = utf8;

create table if not exists aluga(
cnh_cliente int not null,
placa_carro varchar(15) not null,
data varchar(30),
foreign key (cnh_cliente) references cliente(cnh),
foreign key (placa_carro) references carro(placa)
) default charset = utf8;

create table if not exists cliente_telefone(
cod_tel int not null primary key,
cnh_cliente int not null,
telefone varchar(20)
) default charset = utf8;


insert into cliente(cnh, cartao, nome)
values ('2147483647', '2676542390072', 'marcos');

insert into cliente(cnh, cartao, nome)
values ('15263974', '152648957157', 'joao');

insert into cliente(cnh, cartao, nome)
values ('76212354', '879686869964', 'Maria');

select *from cliente;
show tables;