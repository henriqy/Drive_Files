-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 16:51
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
-- Banco de dados: `agencia_carros`
--
CREATE DATABASE IF NOT EXISTS `agencia_carros` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `agencia_carros`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `numAg` int(11) NOT NULL,
  `end_CEP` int(11) NOT NULL,
  `end_rua` int(11) NOT NULL,
  `end_num` int(11) NOT NULL,
  `end_cidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`numAg`, `end_CEP`, `end_rua`, `end_num`, `end_cidade`) VALUES
(3, 69033, 0, 13, 0),
(4, 67413, 0, 161, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluguel_carros`
--

CREATE TABLE `aluguel_carros` (
  `dia` datetime NOT NULL,
  `cnh_cli` int(11) NOT NULL,
  `placa_carro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` int(11) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `ano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa`, `modelo`, `ano`) VALUES
(0, 'LOGAN', 2022);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cartao` int(11) NOT NULL,
  `telefone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`, `telefone`) VALUES
(1, 'Duda', 2147483647, 145485),
(2, 'Duda', 11111111, 145485),
(4, 'Sarah', 11111111, 145485),
(5, 'Sarah', 11111111, 145485),
(8, 'Brno', 11111111, 145485),
(10, 'cAIO', 11111111, 145485),
(13, 'joao', 11111111, 145485);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`numAg`);

--
-- Índices para tabela `aluguel_carros`
--
ALTER TABLE `aluguel_carros`
  ADD KEY `cnh_cli` (`cnh_cli`),
  ADD KEY `placa_carro` (`placa_carro`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cnh`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluguel_carros`
--
ALTER TABLE `aluguel_carros`
  ADD CONSTRAINT `aluguel_carros_ibfk_1` FOREIGN KEY (`cnh_cli`) REFERENCES `cliente` (`cnh`),
  ADD CONSTRAINT `aluguel_carros_ibfk_2` FOREIGN KEY (`placa_carro`) REFERENCES `carro` (`placa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
