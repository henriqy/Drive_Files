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
-- Banco de dados: `locadora`
--
CREATE DATABASE IF NOT EXISTS `locadora` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `locadora`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `numag` int(11) NOT NULL,
  `end_cep` varchar(8) NOT NULL,
  `end_rua` varchar(50) NOT NULL,
  `end_nem` varchar(5) NOT NULL,
  `end_cidade` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluga`
--

CREATE TABLE `aluga` (
  `cod_cli` int(11) NOT NULL,
  `placa` int(11) NOT NULL,
  `data` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` int(11) NOT NULL,
  `modelo` varchar(7) NOT NULL,
  `ano` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cod_cli` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cnh` varchar(16) NOT NULL,
  `cartao` varchar(16) DEFAULT NULL,
  `telefone` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cod_cli`, `nome`, `cnh`, `cartao`, `telefone`) VALUES
(1, 'Sidney oliveira', '1234567891236549', '1234567123456987', '92985555555666');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`numag`),
  ADD UNIQUE KEY `end_nem` (`end_nem`);

--
-- Índices para tabela `aluga`
--
ALTER TABLE `aluga`
  ADD KEY `cod_cli` (`cod_cli`),
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
  ADD PRIMARY KEY (`cod_cli`),
  ADD UNIQUE KEY `cnh` (`cnh`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluga`
--
ALTER TABLE `aluga`
  ADD CONSTRAINT `aluga_ibfk_1` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`),
  ADD CONSTRAINT `aluga_ibfk_2` FOREIGN KEY (`placa`) REFERENCES `carro` (`placa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
