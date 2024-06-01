#CRIANDO BANCO DE DADOS DO SISTEMA ACADEMICO

CREATE DATABASE academico
default character set utf8
default collate utf8_general_ci;

SHOW DATABASES;

USE academico;

#CRIAR TABELA DE USUARIOS

CREATE TABLE IF NOT EXISTS usuarios(
id int not null auto_increment primary key,
matricula int not null unique,
nome varchar(120) not null,
email varchar(120) not null,
senha varchar(32) not null,
estatus varchar(120) not null,
painel varchar(80) not null,
datacadastro timestamp not null default current_timestamp #pegar a data e hora atual
)default charset=utf8;


SHOW TABLES;

DESC usuarios;

SELECT * FROM usuarios;


# INSERINDO DADOS NA TABELA USARIOS

INSERT INTO usuarios(
id, 
matricula, 
nome, 
email,
senha, 
estatus, 
painel
) VALUES('1', '001', 'Henrique', 'henribrnet@gmail.com', md5('1234'), 'Ativo', 'Administrador');

INSERT INTO usuarios(
id, 
matricula, 
nome, 
email,
senha, 
estatus, 
painel
) VALUES('2', '002', 'Eduardo', 'karloseoliveira@gmail.com', md5('12345'), 'Inativo', 'Aluno');

INSERT INTO usuarios(
id, 
matricula, 
nome, 
email,
senha, 
estatus, 
painel
) VALUES('3', '003', 'Carlos', 'mobbrnet@gmail.com', md5('123456'), 'Ativo', 'Professor');

 
 SELECT * FROM usuarios;
