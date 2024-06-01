-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Nov-2023 às 16:49
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
-- Banco de dados: `estudocaso_vendas`
--
CREATE DATABASE IF NOT EXISTS `estudocaso_vendas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `estudocaso_vendas`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `end_rua` varchar(60) DEFAULT NULL,
  `end_num` varchar(5) DEFAULT NULL,
  `end_bairro` varchar(40) DEFAULT NULL,
  `end_cep` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`codigo`, `nome`, `cpf`, `end_rua`, `end_num`, `end_bairro`, `end_cep`) VALUES
(1, 'André', '11111111111', 'Rua A', '99', 'Bairro A', '69111111'),
(2, 'Bruna', '22222222222', 'Rua B', '199', 'Bairro B', '69222222'),
(3, 'Caio', '33333333333', 'Rua C', '299', 'Bairro C', '69333333');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_telefone`
--

CREATE TABLE `cliente_telefone` (
  `codigo` int(11) NOT NULL,
  `cod_cli` int(11) NOT NULL,
  `numero` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `codigo` int(11) NOT NULL,
  `cod_cli` int(11) NOT NULL,
  `cod_func` int(11) NOT NULL,
  `qtd_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `codigo` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codigo` int(11) NOT NULL,
  `cod_depto` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `codigo` int(11) NOT NULL,
  `cod_forn` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `valor` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prod_compra`
--

CREATE TABLE `prod_compra` (
  `cod_produto` int(11) NOT NULL,
  `cod_compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices para tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_cli` (`cod_cli`);

--
-- Índices para tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_cli` (`cod_cli`),
  ADD KEY `cod_func` (`cod_func`);

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `cod_depto` (`cod_depto`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cod_forn` (`cod_forn`);

--
-- Índices para tabela `prod_compra`
--
ALTER TABLE `prod_compra`
  ADD KEY `cod_produto` (`cod_produto`),
  ADD KEY `cod_compra` (`cod_compra`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cliente_telefone`
--
ALTER TABLE `cliente_telefone`
  ADD CONSTRAINT `cliente_telefone_ibfk_1` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`codigo`);

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`codigo`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`cod_func`) REFERENCES `funcionario` (`codigo`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cod_depto`) REFERENCES `departamento` (`codigo`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`cod_forn`) REFERENCES `fornecedor` (`codigo`);

--
-- Limitadores para a tabela `prod_compra`
--
ALTER TABLE `prod_compra`
  ADD CONSTRAINT `prod_compra_ibfk_1` FOREIGN KEY (`cod_produto`) REFERENCES `produto` (`codigo`),
  ADD CONSTRAINT `prod_compra_ibfk_2` FOREIGN KEY (`cod_compra`) REFERENCES `compra` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
