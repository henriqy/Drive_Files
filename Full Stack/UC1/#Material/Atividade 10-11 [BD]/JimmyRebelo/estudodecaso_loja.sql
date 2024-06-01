-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 16:31
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
-- Banco de dados: `estudodecaso_loja`
--
CREATE DATABASE IF NOT EXISTS `estudodecaso_loja` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `estudodecaso_loja`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `num_agencia` int(11) NOT NULL,
  `end_agencia` varchar(50) NOT NULL,
  `cep_agencia` varchar(11) NOT NULL,
  `cid_agencia` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluga`
--

CREATE TABLE `aluga` (
  `data_aluga` datetime NOT NULL,
  `cnh` int(11) NOT NULL,
  `placa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` int(11) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `ano` varchar(11) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cartao` varchar(11) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`, `telefone`) VALUES
(11115555, 'jmmmy', '22233344455', '2222244444'),
(22226666, 'elizandra', '33333666666', '3333355555');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_telefone`
--

CREATE TABLE `cliente_telefone` (
  `codigo` int(11) NOT NULL,
  `cod_cli` int(11) NOT NULL,
  `numero` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  ADD PRIMARY KEY (`placa`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnh`),
  ADD UNIQUE KEY `cartao` (`cartao`);

--
-- Índices para tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_cli` (`cod_cli`);

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
-- Limitadores para a tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD CONSTRAINT `cliente_telefone_ibfk_1` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cnh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
