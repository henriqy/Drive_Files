-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 16:52
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `locadora_carros`
--
CREATE DATABASE IF NOT EXISTS `locadora_carros` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `locadora_carros`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `numag` int(11) NOT NULL,
  `end_cep` varchar(60) NOT NULL,
  `end_rua` varchar(60) NOT NULL,
  `end_num` varchar(60) NOT NULL,
  `end_cidade` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`numag`, `end_cep`, `end_rua`, `end_num`, `end_cidade`) VALUES
(1, '69081230', 'Rua A', '16', 'Manaus'),
(2, '67081460', 'Rua B', '190', 'Manaus'),
(3, '6901256', 'Rua C', '140', 'Manaus');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluga`
--

CREATE TABLE `aluga` (
  `cnh_cli` varchar(16) NOT NULL,
  `placa_carro` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(10) NOT NULL,
  `modelo` varchar(60) NOT NULL,
  `ano` varchar(10) DEFAULT NULL,
  `num_ag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa`, `modelo`, `ano`, `num_ag`) VALUES
('123456', 'Uno', '2010', 1),
('13S686', 'Mobi', '2018', 2),
('154A694', 'Jeep', '2019', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` varchar(16) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cartao` varchar(16) NOT NULL,
  `telefone` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`, `telefone`) VALUES
('1', 'Joana', '202020202', '2334567891'),
('111111111', 'Maria', '1010101010', '1345678910'),
('333333333333', 'Thomas', '3030303030', '355647890');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_tel`
--

CREATE TABLE `cliente_tel` (
  `cod_tel` int(11) NOT NULL,
  `cnh_cliente` varchar(16) NOT NULL,
  `telefone` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`numag`);

--
-- Índices para tabela `aluga`
--
ALTER TABLE `aluga`
  ADD PRIMARY KEY (`placa_carro`),
  ADD KEY `cnh_cli` (`cnh_cli`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `num_ag` (`num_ag`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnh`),
  ADD UNIQUE KEY `cartao` (`cartao`);

--
-- Índices para tabela `cliente_tel`
--
ALTER TABLE `cliente_tel`
  ADD PRIMARY KEY (`cod_tel`),
  ADD KEY `cnh_cliente` (`cnh_cliente`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluga`
--
ALTER TABLE `aluga`
  ADD CONSTRAINT `aluga_ibfk_1` FOREIGN KEY (`cnh_cli`) REFERENCES `cliente` (`cnh`),
  ADD CONSTRAINT `aluga_ibfk_2` FOREIGN KEY (`placa_carro`) REFERENCES `carro` (`placa`);

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`num_ag`) REFERENCES `agencia` (`numag`);

--
-- Limitadores para a tabela `cliente_tel`
--
ALTER TABLE `cliente_tel`
  ADD CONSTRAINT `cliente_tel_ibfk_1` FOREIGN KEY (`cnh_cliente`) REFERENCES `cliente` (`cnh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
