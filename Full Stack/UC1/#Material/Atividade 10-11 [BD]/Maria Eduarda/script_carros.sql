create database agencia_carros
default character set utf8
default collate utf8_general_ci;


show databases;
use agencia_carros;


#criando tabela cliente
create table if not exists cliente(
cnh int not null primary key,
nome varchar(100) not null,
cartao varchar(15) not null,
telefone varchar(15) not null
) default charset=utf8;

#criando tabela carro
create table if not exists carro(
placa int null primary key,
modelo varchar(100) not null ,
ano int not null
) default charset=utf8;

#criando tabela agencia 
create table if not exists agencia(
numAg int not null primary key,
end_CEP varchar(15) not null,
end_rua varchar(50) not null,
end_num int not null,
end_cidade varchar(20) not null
) default charset=utf8;

create table if not exists aluguel_carros(
dia datetime not null,
cnh_cli int not null,
placa_carro int not null,
foreign key (cnh_cli) references cliente(cnh),
foreign key (placa_carro) references carro(placa)

)default charset=utf8;

show tables;

INSERT INTO cliente(cnh,nome,cartao,telefone)
values('1' ,'Duda','11111111','145485');

