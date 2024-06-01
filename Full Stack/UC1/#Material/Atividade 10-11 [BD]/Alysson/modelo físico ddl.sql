create database projeto_agencia
default charset utf8
default collate utf8_general_ci;

show databases;

use projeto_agencia;

create table if not exists cliente (
	cnh int(10) not null primary key,
	nome varchar(60) not null,
	cartao bigint(16) not null,
	telefone bigint(13)	
) default charset=utf8;


create table if not exists agencia (
	num_ag int not null primary key,
    end_cep int(8),
    end_rua varchar(60),
    end_num varchar(10),
    end_cid varchar(45)
) default charset=utf8;


create table if not exists carro (
	placa varchar(7) not null primary key,
    modelo varchar(20) not null,
    ano int(4) not null,
    num_ag int not null,
    foreign key(num_ag) references agencia(num_ag)
) default charset=utf8;

show tables;

create table if not exists aluguel (
	cnh_cliente int(10) not null,
    placa_carro varchar(7) not null,
    data_aluguel date not null,
    foreign key (cnh_cliente) references cliente (cnh),
    foreign key (placa_carro) references carro (placa)
) default charset=utf8;
