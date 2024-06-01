#ADICIONANDO DADOS NAS TABELAS

#Inserindo dados na tabela CLIENTE

INSERT INTO cliente(codigo, nome, cpf, end_rua, end_num, end_bairro, end_cep)
VALUES ('1', 'André', '11111111111', 'Rua A', '99', 'Bairro A','69111111' );

INSERT INTO cliente(codigo, nome, cpf, end_rua, end_num, end_bairro, end_cep)
VALUES ('2', 'Bruna', '22222222222', 'Rua B', '199', 'Bairro B','69222222' );

INSERT INTO cliente(codigo, nome, cpf, end_rua, end_num, end_bairro, end_cep)
VALUES ('3', 'Caio', '33333333333', 'Rua C', '299', 'Bairro C','69333333' );

select *from cliente;

#Inserindo dados na tabela FORNECEDOR

INSERT INTO fornecedor(codigo, nome, telefone)
VALUES ('1', 'Fornecedor Um', '92933442201');

INSERT INTO fornecedor(codigo, nome, telefone)
VALUES ('2', 'Fornecedor Dois', '92944553302');

select *from fornecedor;


#Inserindo dados na tabela DEPARTAMENTO

INSERT INTO departamento(codigo, descricao)
VALUES ('1', 'Vendas');

INSERT INTO departamento(codigo, descricao)
VALUES ('2', 'Administrativo');


select *from departamento;

#Inserindo dados na tabela PRODUTO

INSERT INTO produto(codigo, cod_forn, descricao, valor)
VALUES ('1', '1', 'Produto um', '10.99');

INSERT INTO produto(codigo, cod_forn, descricao, valor)
VALUES ('2', '2', 'Produto dois', '20.99');

INSERT INTO produto(codigo, cod_forn, descricao, valor)
VALUES ('3', '1', 'Produto tres', '30.99');

select *from produto;

#Inserindo dados na tabela FUNCIONARIO

INSERT INTO funcionario(codigo, cod_depto, nome, cpf)
VALUES ('1', '1', 'Iolanda', '12345678900');

INSERT INTO funcionario(codigo, cod_depto, nome, cpf)
VALUES ('2', '2', 'Martin', '33322244400');


select *from funcionario;


#Inserindo dados na tabela CLIENTE_TELEFONE

INSERT INTO cliente_telefone(codigo, cod_cli, numero)
VALUES ('1', '1', '9233334444');

select *from cliente_telefone;



select *from funcionario;

#Inserindo dados na tabela COMPRA

INSERT INTO compra(codigo, cod_cli, cod_func, qtd_prod)
VALUES ('1', '1', '1', '2');

select *from compra;

#Inserindo dados na tabela PROD_COMPRA

INSERT INTO prod_compra(cod_prod, cod_compra)
VALUES ('1', '1');

INSERT INTO prod_compra(cod_prod, cod_compra)
VALUES ('2', '1');

select *from prod_compra;
