#Criando e usando o Banco de Dados da Locadora de Carros

create database dblocadora
default character set utf8
default collate utf8_general_ci;

use dblocadora;

#Criando as tabelas do Banco de dados

create table if not exists cliente(
cnh varchar(9) not null primary key,
nome varchar(100) not null,
cartao varchar(16) not null,
telefone varchar(9) not null
) default char set utf8;
 

create table if not exists agencia(
num_agencia varchar(45) not null primary key,
end_rua varchar(80),
end_numero varchar(10),
end_bairro varchar(60),
end_cidade varchar(80),
end_cep varchar(8)
) default char set utf8;

create table if not exists carro(
placa varchar(7) not null primary key,
num_agencia varchar(45) not null,
modelo varchar(45) not null,
ano varchar(4) not null,
foreign key (num_agencia) references agencia(num_agencia)
) default char set utf8;

create table if not exists	aluga(
cnh varchar(9) not null,
placa varchar(7) not null,
data_aluga varchar(10) not null,
foreign key (cnh) references cliente(cnh),
foreign key (placa) references carro(placa)
) default char set utf8;
