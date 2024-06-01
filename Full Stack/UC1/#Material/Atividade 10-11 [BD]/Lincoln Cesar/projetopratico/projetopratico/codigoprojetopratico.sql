create database projetopratico
use projetopratico
default character set uft8
default collate uft8_general_ci;

show databases;

use projetopratico;

show tables;

create table if not exists cliente(
cnh int(14) not null primary key,
nome varchar(100),
cartao varchar(16),
telefone varchar(13)
)default charset=utf8;

create table agencia (
numag int not null primary key,
cep varchar(12),
rua varchar(40),
num int(6),
cidade varchar(30)
)default charset=utf8;

create table if not exists carro(
placa varchar(7) not null primary key,
numag int not null,
modelo varchar(20),
ano int(4),
foreign key(numag) references agencia(numag)
)default charset=utf8;

create table if not exists aluga(
cliente_cnh int not null,
carro_placa varchar(7) not null,
foreign key (cliente_cnh) references cliente(cnh),
foreign key (carro_placa) references carro(placa)
)default charset=utf8;

alter table aluga add column data varchar(10);

show tables;
desc agencia;
desc aluga;
desc cliente;
desc carro;

INSERT INTO cliente(cnh, nome, cartao, telefone)
VALUES ('123532521', 'teste', '1231261262', '982297266');

INSERT INTO cliente(cnh, nome, cartao, telefone)
VALUES ('123573257', 'teste2', '1225725762', '92572757');

INSERT INTO cliente(cnh, nome, cartao, telefone)
VALUES ('147247421', 'teste3', '1233685490', '98464666');

INSERT INTO agencia(numag, cep, rua, num, cidade)
VALUES ('12345', '69060020', 'A', '1', 'manaus');

INSERT INTO agencia(numag, cep, rua, num, cidade)
VALUES ('23456', '99060030', 'B', '2', 'manacapuru');

INSERT INTO carro(placa, numag, modelo, ano)
VALUES ('FHX5419', '12345', 'VW2', '1991');

INSERT INTO carro(placa, numag, modelo, ano)
VALUES ('PHX5222', '12345', 'toyota', '2000');

INSERT INTO carro(placa, numag, modelo, ano)
VALUES ('LUD4722', '12345', 'HONDA', '2050');