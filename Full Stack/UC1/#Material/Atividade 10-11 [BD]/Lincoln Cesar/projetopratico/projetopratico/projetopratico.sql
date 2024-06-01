-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 16:40
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
-- Banco de dados: `projetopratico`
--
CREATE DATABASE IF NOT EXISTS `projetopratico` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projetopratico`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `numag` int(11) NOT NULL,
  `cep` varchar(12) DEFAULT NULL,
  `rua` varchar(40) DEFAULT NULL,
  `num` int(6) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`numag`, `cep`, `rua`, `num`, `cidade`) VALUES
(12345, '69060020', 'A', 1, 'manaus'),
(23456, '99060030', 'B', 2, 'manacapuru');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluga`
--

CREATE TABLE `aluga` (
  `cliente_cnh` int(11) NOT NULL,
  `carro_placa` varchar(7) NOT NULL,
  `data` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa` varchar(7) NOT NULL,
  `numag` int(11) NOT NULL,
  `modelo` varchar(20) DEFAULT NULL,
  `ano` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa`, `numag`, `modelo`, `ano`) VALUES
('FHX5419', 12345, 'VW2', 1991),
('LUD4722', 12345, 'HONDA', 2050),
('PHX5222', 12345, 'toyota', 2000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cnh` int(14) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cartao` varchar(16) DEFAULT NULL,
  `telefone` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cnh`, `nome`, `cartao`, `telefone`) VALUES
(123532521, 'teste', '1231261262', '982297266'),
(123573257, 'teste2', '1225725762', '92572757');

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
  ADD KEY `cliente_cnh` (`cliente_cnh`),
  ADD KEY `carro_placa` (`carro_placa`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `numag` (`numag`);

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
  ADD CONSTRAINT `aluga_ibfk_1` FOREIGN KEY (`cliente_cnh`) REFERENCES `cliente` (`cnh`),
  ADD CONSTRAINT `aluga_ibfk_2` FOREIGN KEY (`carro_placa`) REFERENCES `carro` (`placa`);

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`numag`) REFERENCES `agencia` (`numag`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
