-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Dez-2023 às 16:47
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
-- Banco de dados: `academico`
--
CREATE DATABASE IF NOT EXISTS `academico` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `academico`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `estatus` varchar(120) NOT NULL,
  `painel` varchar(80) NOT NULL,
  `datacadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `matricula`, `nome`, `email`, `senha`, `estatus`, `painel`, `datacadastro`) VALUES
(1, 1, 'Henrique', 'henribrnet@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Ativo', 'Administrador', '2023-12-06 14:47:27'),
(2, 2, 'Eduardo', 'karloseoliveira@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Inativo', 'Aluno', '2023-12-06 14:47:27'),
(3, 3, 'Carlos', 'mobbrnet@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Ativo', 'Professor', '2023-12-06 14:47:27'),
(4, 4, 'Oliveira', 'Oliveira@gmail.com', 'eb62f6b9306db575c2d596b1279627a4', 'Ativo', 'Aluno', '2023-12-06 15:23:34'),
(5, 5, 'Aoba', 'aoba@gmail.com', '4100c4d44da9177247e44a5fc1546778', 'Ativo', 'Professor', '2023-12-06 15:32:43'),
(6, 6, 'Escalobaloba', 'loba@gmail.com', 'd6a9a933c8aafc51e55ac0662b6e4d4a', 'Ativo', 'Aluno', '2023-12-11 15:27:47');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matricula` (`matricula`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
