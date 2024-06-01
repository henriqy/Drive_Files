# Criando o Banco de Dados
create database estudocaso_vendas
default character set utf8
default collate utf8_general_ci;


#Mostrando os bancos de dados criados
show databases;

#Colocando o Banco de Dados em uso
use estudocaso_vendas;

show tables;

#Criando a tabela CLIENTE
create table if not exists cliente (
codigo int not null primary key,
nome varchar(100) not null,
cpf varchar(11) not	null unique,
end_rua varchar(60),
end_num varchar(5),
end_bairro varchar(40),
end_cep varchar(9)
)default charset=utf8;

show tables;

#Verificando a estrutura de uma tabela
desc cliente;

#Excluindo uma tabela
drop table if exists produto;

create table if not exists cliente_telefone (
codigo int not null primary key,
cod_cli int not null,
numero varchar(13),
foreign key(cod_cli) references cliente(codigo)
)default charset=utf8;

create table if not exists departamento (
codigo_dep int not null primary key,
descricao varchar(100) not null
)default charset=utf8;

create table if not exists fornecedor (
codigo int not null primary key,
nome_fornecedor varchar(100) not null,
nome_produto varchar(100) not null,
tel_fornecedor varchar(13) not null
)default charset=utf8;

create table if not exists produto (
codigo_produto int not null primary key,
cod_forn int not null,
descricao varchar(100) not null,
valor decimal(5,2),
foreign key(cod_forn) references fornecedor(codigo)
)default charset=utf8;

show tables;
drop table if exists produto;

create table if not exists funcionario (
codigo_funcionario int not null primary key,
cod_depto int not null,
nome_func varchar(100) not null,
cpf varchar(11) not null unique,
foreign key(cod_depto) references departamento(codigo_dep)
)default charset=utf8;

create table if not exists funcionario_telefone (
codigo int not null primary key,
cod_func int not null,
numero varchar(13),
foreign key(cod_func) references funcionario(codigo_funcionario)
)default charset=utf8;

create table if not exists compra(
codigo_comp int not null primary key, 
cod_func int not null, 
cod_cliente int not null,
cod_prod int not null,
quantidade int not null,
foreign key(cod_func) references funcionario(codigo_funcionario),
foreign key(cod_cliente) references cliente(codigo)
)default charset=utf8;

drop table if exists compra;
show tables;

create table if not exists produto_compra(
cod_compra int not null, 
cod_produto int not null, 
foreign key(cod_compra) references compra(codigo_comp),
foreign key(cod_produto) references produto(codigo_produto)
)default charset=utf8;







