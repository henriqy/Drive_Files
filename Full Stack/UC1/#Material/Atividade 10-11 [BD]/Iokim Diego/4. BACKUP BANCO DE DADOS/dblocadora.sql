-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 16:55
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
-- Banco de dados: `dblocadora`
--
CREATE DATABASE IF NOT EXISTS `dblocadora` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dblocadora`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `num_agencia` varchar(45) NOT NULL,
  `end_rua` varchar(80) DEFAULT NULL,
  `end_numero` varchar(10) DEFAULT NULL,
  `end_bairro` varchar(60) DEFAULT NULL,
  `end_cidade` varchar(80) DEFAULT NULL,
  `end_cep` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`num_agencia`, `end_rua`, `end_numero`, `end_bairro`, `end_cidade`, `end_cep`) VALUES
('100', 'Rua A', '11', 'Bairro Um', 'Cidade A', '11111111'),
('200', 'Rua B', '22', 'Bairro Dois', 'Cidade B', '22222222'),
('300', 'Rua C', '33', 'Bairro Três', 'Cidade C', '33333333');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluga`
--

CREATE TABLE `aluga` (
  `cnh` varchar(9) NOT NULL,
  `placa` varchar(7) NOT NULL,
  `data_aluga` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `aluga`
--

INSERT INTO `aluga` (`cnh`, `placa`, `data_aluga`) VALUES
('111111111', 'ABC1D23', '10/11/2023'),
('222222222', 'EFG2H34', '29/12/2023'),
('333333333', 'IJK3L45', '02/03/2024');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(7) NOT NULL,
  `num_agencia` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `ano` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa`, `num_agencia`, `modelo`, `ano`) VALUES
('ABC1D23', '100', 'Voyage', '2022'),
('EFG2H34', '200', 'Onyx Plus', '2023'),
('IJK3L45', '300', 'Chronos', '2024');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` varchar(9) NOT NULL,
  `cartao` varchar(16) NOT NULL,
  `telefone` varchar(9) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `cartao`, `telefone`, `nome`) VALUES
('111111111', '11111111', '911111111', 'Jose'),
('222222222', '22222222', '922222222', 'Maria'),
('333333333', '33333333', '933333333', 'Ana');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`num_agencia`);

--
-- Índices para tabela `aluga`
--
ALTER TABLE `aluga`
  ADD KEY `cnh` (`cnh`),
  ADD KEY `placa` (`placa`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `num_agencia` (`num_agencia`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnh`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluga`
--
ALTER TABLE `aluga`
  ADD CONSTRAINT `aluga_ibfk_1` FOREIGN KEY (`cnh`) REFERENCES `cliente` (`cnh`),
  ADD CONSTRAINT `aluga_ibfk_2` FOREIGN KEY (`placa`) REFERENCES `carro` (`placa`);

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`num_agencia`) REFERENCES `agencia` (`num_agencia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
