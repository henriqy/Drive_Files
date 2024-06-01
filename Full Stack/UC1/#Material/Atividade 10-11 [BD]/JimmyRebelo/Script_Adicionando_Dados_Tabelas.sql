#CRIANDO BANCO DE DADOS ATIVIDADE_LOJA
create database estudodecaso_loja
default character set utf8
default collate utf8_general_ci;

#Mostra Bando de dados criados
show databases;

#Colocando bando de dados em uso
use estudodecaso_loja;

show tables;

#CRIANDO TABELA CLIENTES
create table if not exists cliente (
cnh int not null primary key,
nome varchar(100) not null,
cartao varchar(11) not null unique,
telefone varchar(15)
)default charset=utf8;

#CRIANDO TABELA CARRO
create table if not exists carro (
placa int not null primary key,
modelo varchar(20) not null,
ano varchar(11) not null ,
telefone varchar(15)
)default charset=utf8;
show tables;

#CRIANDO TABELA AGENCIA
create table if not exists agencia (
num_agencia int not null primary key,
end_agencia varchar(50) not null,
cep_agencia varchar(11) not null ,
cid_agencia varchar(15)
)default charset=utf8;
show tables;



#Verificando a estrutura de uma tabela
desc carro;

drop table cliente;


#CRIANDO TABELA CLIENTE TELEFONE

create table if not exists cliente_telefone (
codigo int not null primary key,
cod_cli int not null, 
numero varchar(13) not null,
foreign key(cod_cli) references cliente(cnh)
)default charset=utf8;

show tables;

#CRIANDO TABELA ALUGA
create table if not exists aluga (
data_aluga datetime not null,
cnh int not null,
placa int not null,
foreign key(cnh) references cliente(cnh),
foreign key(placa) references carro(placa)
)default charset=utf8;



show tables;


insert into cliente(cnh,nome,cartao,telefone)
values('11115555','jmmmy','22233344455','2222244444');
insert into cliente(cnh,nome,cartao,telefone)
values('22226666','elizandra','33333666666','3333355555');


select *from cliente;




