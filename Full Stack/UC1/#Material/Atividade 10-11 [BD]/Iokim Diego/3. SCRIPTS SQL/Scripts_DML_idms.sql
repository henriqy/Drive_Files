#Inserindo Registros no Banco de Dados da Locadora

#Tabela Cliente
insert into cliente(cnh, nome, cartao, telefone)
values ('111111111', 'Jose','11111111','911111111');
insert into cliente(cnh, nome, cartao, telefone)
values ('222222222', 'Maria','22222222','922222222');
insert into cliente(cnh, nome, cartao, telefone)
values ('333333333', 'Ana','33333333','933333333');

select * from cliente;


#Tabela Agencia
insert into agencia(num_agencia, end_rua, end_numero, end_bairro, end_cidade, end_cep)
values ('100', 'Rua A', '11', 'Bairro Um', 'Cidade A', '11111111');
insert into agencia(num_agencia, end_rua, end_numero, end_bairro, end_cidade, end_cep)
values ('200', 'Rua B', '22', 'Bairro Dois', 'Cidade B', '22222222');
insert into agencia(num_agencia, end_rua, end_numero, end_bairro, end_cidade, end_cep)
values ('300', 'Rua C', '33', 'Bairro Três', 'Cidade C', '33333333');

select * from agencia;

#Tabela Carro
insert into carro(placa, num_agencia, modelo, ano)
values ('ABC1D23', '100', 'Voyage', '2022');
insert into carro(placa, num_agencia, modelo, ano)
values ('EFG2H34', '200', 'Onyx Plus', '2023');
insert into carro(placa, num_agencia, modelo, ano)
values ('IJK3L45', '300', 'Chronos', '2024');

select * from carro;

#Tabela Aluga
insert into aluga(cnh, placa, data_aluga)
values('111111111', 'ABC1D23', '10/11/2023');
insert into aluga(cnh, placa, data_aluga)
values('222222222', 'EFG2H34', '29/12/2023');
insert into aluga(cnh, placa, data_aluga)
values('333333333', 'IJK3L45', '02/03/2024');

select * from aluga;
