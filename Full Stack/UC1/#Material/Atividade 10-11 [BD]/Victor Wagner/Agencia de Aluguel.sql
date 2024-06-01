# Criando o Banco de Dados
create database agencia_aluguel
default character set utf8
default collate utf8_general_ci;

use agencia_aluguel;

#Tabela CLIENTE
create table if not exists cliente (
cnh varchar(11) not null primary key,
nome varchar(100),
cartao varchar(20)
)default charset=utf8;

desc cliente;
show tables;


#Tabela Cliente_Telefone
create table if not exists cliente_telefone (
cod_clin int not null primary key,
numero varchar(13)
)default charset=utf8;

show tables;


#Tabela Carro
create table if not exists carro (
placa varchar(7) not null primary key,
modelo int not null,
ano int not null
)default charset=utf8;

show tables;


#Tabela Agencia 
create table if not exists agencia (
num_ag  int not null primary key,
end_rua varchar(60),
end_num varchar(5),
end_bairro varchar(40),
end_cep varchar(9)
)default charset=utf8;

show tables;


#Tabela Aluga
create table if not exists aluga (
cod_cnh varchar(11) not null,
cod_placa varchar(7) not null,
foreign key(cod_cnh) references cliente(cnh),
foreign key(cod_placa) references carro(placa),
data varchar(12)
)default charset=utf8;

desc aluga;
show tables;
select *from agencia;


# Inserir dados na Tabelas

insert into cliente(cnh, nome, cartao)
values ('12345678989', 'Pedro', '123456789123456');
select *from cliente;

insert into cliente(cnh, nome, cartao)
values ('98765432121', 'Madalena', '987654321654321');
select *from cliente;

insert into cliente(cnh, nome, cartao)
values ('456456456123', 'Mordecai', '587321987321654');


show tables;
#Verificando a estrutura de uma tabela
desc 
#Excluindo uma tabela
drop table if exists 