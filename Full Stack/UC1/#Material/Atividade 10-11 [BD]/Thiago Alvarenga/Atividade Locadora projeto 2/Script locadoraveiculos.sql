#Criando o Banco de Dados
create database locadoraveiculos
default character set utf8
default collate utf8_general_ci;

use locadoraveiculos;

#Criando as tabelas

create table if not exists CLIENTE(
cnh varchar(11) not null primary key unique,
nome varchar(100) not null,
cartao varchar(30) not null
)default charset=utf8;

create table if not exists CLIENTE_TELEFONE(
cod_cliente varchar(11) not null,
numero varchar(13) not null,
foreign key (cod_cliente) references cliente(cnh)
)default charset=utf8;

create table if not exists AGENCIA(
numag int not null primary key,
end_cep varchar(9) not null,
end_rua varchar(30) not null,
end_num int not null,
end_cidade varchar(30) not null
)default charset=utf8;

create table  if not exists CARRO(
placa varchar(8) not null primary key,
cod_agen int not null,
modelo varchar(20)not null,
ano	 int not null,
foreign key(cod_agen) references AGENCIA(numag)
)default charset=utf8;

create table if not exists ALUGA(
cod_cnh varchar(11) not null,
cod_placa varchar(8) not null,
dt date not null,
foreign key(cod_cnh)references cliente(cnh),
foreign key(cod_placa)references CARRO(placa)
)default charset=utf8;

#inserindo dados na tabela Cliente

INSERT INTO CLIENTE(cnh, nome, cartao)
VALUES ('00000000000', 'Ricardo', '0000111122223333');

INSERT INTO CLIENTE(cnh, nome, cartao)
VALUES ('11111111111', 'Thiago', '1111222233334444');

INSERT INTO CLIENTE(cnh, nome, cartao)
VALUES ('22222222222', 'Brenda', '0000111122223333');

select *from cliente;

#inserindo dados na tabela cliente_telefone

INSERT INTO CLIENTE_TELEFONE(cod_cliente, numero)
VALUES ('00000000000', '92995213775');

INSERT INTO CLIENTE_TELEFONE(cod_cliente, numero)
VALUES ('11111111111', '92995213774');

INSERT INTO CLIENTE_TELEFONE(cod_cliente, numero)
VALUES ('22222222222', '92995213773');

select *from cliente_telefone;

#inserindo dados na tabela agencia

INSERT INTO AGENCIA(numag, end_cep, end_rua, end_num, end_cidade) 
VALUES ('1', '69097124','r.itabu','26','manaus');

INSERT INTO AGENCIA(numag, end_cep, end_rua, end_num, end_cidade) 
VALUES ('2', '69097123','r.itabuaba','16','manaus');

INSERT INTO AGENCIA(numag, end_cep, end_rua, end_num, end_cidade) 
VALUES ('3', '69097125','r.itabuna','28','manaus');

select *from agencia;

#inserindo dado na tabela carro

INSERT INTO CARRO(placa, cod_agen, modelo, ano) 
VALUES ('ANK04051', '1','GOL','2012');

INSERT INTO carro(placa, cod_agen, modelo, ano) 
VALUES ('JKL1216', '2','CIVIC','2010');

INSERT INTO carro(placa, cod_agen, modelo, ano) 
VALUES ('JKM1216', '3','POLO','2023');

SELECT *FROM CARRO;

#INSERINCO DADO NA TABELA ALUGA

INSERT INTO ALUGA(cod_cnh, cod_placa, dt) 
VALUES ('00000000000', 'ANK04051','2023/10/12');

INSERT INTO ALUGA(cod_cnh, cod_placa, dt) 
VALUES ('11111111111', 'JKL1216','2023/10/12');

INSERT INTO ALUGA(cod_cnh, cod_placa, dt) 
VALUES ('22222222222', 'JKM1216','2023/10/12');

SELECT *FROM ALUGA;

