CREATE DATABASE IF NOT EXISTS locacaodeautomoveis;

CREATE TABLE IF NOT EXISTS cliente(
CNH varchar(11) not null  primary key,
nome varchar(100) not null,
telefone varchar(13) not null
) default charset=utf8;

CREATE TABLE IF NOT EXISTS aluga (
placa varchar(7) not null primary key,
cnh_cli varchar(11) not null,
data_aluga varchar(10),
foreign key(cnh_cli) references cliente(CNH)
)default charset=utf8;

CREATE TABLE IF NOT EXISTS carro(
placa_carro varchar(7) not null,
modelo varchar(50) not null,
ano int not null,
foreign key(placa_carro) references aluga(placa)
) default charset=utf8;



CREATE TABLE IF NOT EXISTS agencia(
numAg int not null primary key,
end_rua varchar(50) not null,
end_bairro varchar(20) not null,
end_num varchar(5) not null,
end_cep varchar(9) not null
) default charset=utf8;

SHOW TABLES;




