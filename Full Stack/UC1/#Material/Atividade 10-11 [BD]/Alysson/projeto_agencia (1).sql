-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 16:46
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
-- Banco de dados: `projeto_agencia`
--
CREATE DATABASE IF NOT EXISTS `projeto_agencia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `projeto_agencia`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `num_ag` int(11) NOT NULL,
  `end_cep` int(8) DEFAULT NULL,
  `end_rua` varchar(60) DEFAULT NULL,
  `end_num` varchar(10) DEFAULT NULL,
  `end_cid` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`num_ag`, `end_cep`, `end_rua`, `end_num`, `end_cid`) VALUES
(1, 69033111, 'rua a', '1', 'manaus'),
(2, 69033222, 'rua b', '2', 'parintins'),
(3, 69033333, 'rua c', '3', 'iranduba');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluguel`
--

CREATE TABLE `aluguel` (
  `cnh_cliente` int(10) NOT NULL,
  `placa_carro` varchar(7) NOT NULL,
  `data_aluguel` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(7) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `ano` int(4) NOT NULL,
  `num_ag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa`, `modelo`, `ano`, `num_ag`) VALUES
('abc1a23', 'civic', 2010, 1),
('abc1b23', 'city', 2011, 2),
('abc1c34', 'palio', 2012, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` int(10) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `cartao` bigint(16) NOT NULL,
  `telefone` bigint(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`num_ag`);

--
-- Índices para tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD KEY `cnh_cliente` (`cnh_cliente`),
  ADD KEY `placa_carro` (`placa_carro`);

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
  ADD PRIMARY KEY (`cnh`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluguel`
--
ALTER TABLE `aluguel`
  ADD CONSTRAINT `aluguel_ibfk_1` FOREIGN KEY (`cnh_cliente`) REFERENCES `cliente` (`cnh`),
  ADD CONSTRAINT `aluguel_ibfk_2` FOREIGN KEY (`placa_carro`) REFERENCES `carro` (`placa`);

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`num_ag`) REFERENCES `agencia` (`num_ag`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
