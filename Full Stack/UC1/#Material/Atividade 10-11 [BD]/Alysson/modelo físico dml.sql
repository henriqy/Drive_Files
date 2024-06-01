insert into cliente(cnh, nome, cartao, telefone)
values ('1234567891', 'andre', '1111', '900001111');

insert into cliente(cnh, nome, cartao, telefone)
values ('1234567892', 'bruna', '2222', '900002222');

insert into cliente(cnh, nome, cartao, telefone)
values ('1234567893', 'carlos', '3333', '900003333');

select *from cliente;

insert into agencia(num_ag, end_cep, end_rua, end_num, end_cid)
values 
('1','69033111', 'rua a', '1', 'manaus'),
('2', '69033222', 'rua b', '2', 'parintins'),
('3', '69033333', 'rua c', '3', 'iranduba');

select *from agencia;

insert into carro (placa, modelo, ano, num_ag)
values
('abc1a23', 'civic', '2010', '1'),
('abc1b23', 'city', '2011', '2'),
('abc1c34', 'palio', '2012', '3');

select *from carro;

insert into aluguel (cnh_cliente, placa_carro, data_aluguel)
values
('1234567891', 'abc1a23', '2023-11-01'),
('1234567892', 'abc1b23', '2023-11-02'),
('1234567893', 'abc1c34', '2023-11-03');

select *from aluguel;

update cliente set cartao='1111222233334444' where cnh='1234567891';
update cliente set cartao='2222333344445555' where cnh='1234567892';
update cliente set cartao='6666777788889999' where cnh='1234567893';

select *from cliente;
desc cliente;
