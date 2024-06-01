INSERT INTO cliente(CNH, nome, telefone)
VALUES('00000000000', 'CARLOS', '1212121212121');

INSERT INTO aluga(placa, cnh_cli, data_aluga)
VALUES('1234567', '00000000000', '2023-11-10');

INSERT INTO carro(placa_carro, modelo, ano)
VALUES('1234567', 'Ferrari', 2020);

INSERT INTO agencia(numAg,end_rua, end_bairro, end_num, end_cep)
VALUES ('1', 'A', 'AA', '100', '444333222');

INSERT INTO cliente(CNH, nome, telefone)
VALUES('20000000000', 'HENRIQUE', '2121212121212');

INSERT INTO aluga(placa_carro, cnh_cli, data_aluga)
VALUES('0987654', '10000000000', '2023-10-11');

INSERT INTO carro(placa_carro, modelo, ano)
VALUES('0987654', 'Porche', 2019);

INSERT INTO agencia(numAg,end_rua, end_bairro, end_num, end_cep)
VALUES ('2', 'B', 'BB', '101', '222333444');

INSERT INTO cliente(CNH, nome, telefone)
VALUES('10000000000', 'OLIVEIRA', '2323232323233');

INSERT INTO aluga(placa, cnh_cli, data_aluga)
VALUES('3456765', '10000000000', '2023-9-12');

INSERT INTO carro(placa_carro, modelo, ano)
VALUES('3456765', 'Fiat', 2022);

INSERT INTO agencia(numAg,end_rua, end_bairro, end_num, end_cep)
VALUES ('3', 'C', 'CC', '102', '55777999');


SELECT * FROM cliente;
SELECT * FROM aluga;
SELECT * FROM carro;

