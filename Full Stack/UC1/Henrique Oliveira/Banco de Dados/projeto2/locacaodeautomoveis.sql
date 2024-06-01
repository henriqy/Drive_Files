-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Nov-2023 às 15:42
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
-- Banco de dados: `locacaodeautomoveis`
--
CREATE DATABASE IF NOT EXISTS `locacaodeautomoveis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `locacaodeautomoveis`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agencia`
--

CREATE TABLE `agencia` (
  `numAg` int(11) NOT NULL,
  `end_rua` varchar(50) NOT NULL,
  `end_bairro` varchar(20) NOT NULL,
  `end_num` varchar(5) NOT NULL,
  `end_cep` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `agencia`
--

INSERT INTO `agencia` (`numAg`, `end_rua`, `end_bairro`, `end_num`, `end_cep`) VALUES
(2, 'B', 'BB', '101', '222333444'),
(3, 'C', 'CC', '102', '55777999');

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluga`
--

CREATE TABLE `aluga` (
  `placa` varchar(7) NOT NULL,
  `cnh_cli` varchar(11) NOT NULL,
  `data_aluga` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `aluga`
--

INSERT INTO `aluga` (`placa`, `cnh_cli`, `data_aluga`) VALUES
('0987654', '10000000000', '2023-10-11'),
('1234567', '00000000000', '2023-11-10'),
('3456765', '10000000000', '2023-9-12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `placa_carro` varchar(7) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `ano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`placa_carro`, `modelo`, `ano`) VALUES
('3456765', 'Fiat', 2022),
('3456765', 'Fiat', 2022),
('0987654', 'Porche', 2019),
('1234567', 'Ferrari', 2020);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `CNH` varchar(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`CNH`, `nome`, `telefone`) VALUES
('00000000000', 'CARLOS', '1212121212121'),
('10000000000', 'OLIVEIRA', '2323232323233'),
('20000000000', 'HENRIQUE', '2121212121212');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agencia`
--
ALTER TABLE `agencia`
  ADD PRIMARY KEY (`numAg`);

--
-- Índices para tabela `aluga`
--
ALTER TABLE `aluga`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `cnh_cli` (`cnh_cli`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD KEY `placa_carro` (`placa_carro`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CNH`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `aluga`
--
ALTER TABLE `aluga`
  ADD CONSTRAINT `aluga_ibfk_1` FOREIGN KEY (`cnh_cli`) REFERENCES `cliente` (`CNH`);

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`placa_carro`) REFERENCES `aluga` (`placa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
