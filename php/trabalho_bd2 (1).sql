-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27-Jun-2017 às 18:50
-- Versão do servidor: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trabalho_bd2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aviao`
--

CREATE TABLE `aviao` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `num_poltronas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `aviao`
--

INSERT INTO `aviao` (`id`, `nome`, `num_poltronas`) VALUES
(1, '', 300),
(2, '', 300),
(3, '', 300),
(4, '', 400),
(5, 'airbus 390 ', 150);

-- --------------------------------------------------------

--
-- Estrutura da tabela `passagem`
--

CREATE TABLE `passagem` (
  `id` int(11) NOT NULL,
  `origem` varchar(255) NOT NULL,
  `destino` varchar(255) NOT NULL,
  `dt_partida` date NOT NULL,
  `dt_chegada` date NOT NULL,
  `num_poltrona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `passagem`
--

INSERT INTO `passagem` (`id`, `origem`, `destino`, `dt_partida`, `dt_chegada`, `num_poltrona`) VALUES
(1, 'BrasÃ­lia', 'Natal', '2017-06-14', '2017-06-30', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `dt_nasc` date NOT NULL,
  `telefone` int(11) NOT NULL,
  `cpf` int(11) NOT NULL,
  `sexo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `login`, `senha`, `nome`, `email`, `endereco`, `dt_nasc`, `telefone`, `cpf`, `sexo`) VALUES
(1, 'aaaaa', 'aaaaaaa', 'aaaaa', 'aaaaa', 'aaaaa', '2017-06-08', 1111111, 2147483647, 'm'),
(2, 'felipemelo', '', 'Felipe de Melo Pinto', 'felipe.melo@gmail.com', 'Q', '0000-00-00', 0, 2147483647, ''),
(3, 'felipemelo', 'felipemelo', 'Felipe de Melo Pinto', 'felipe.melo@gmail.com', 'Quadra 18', '1997-09-29', 2147483647, 2147483647, 'f');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aviao`
--
ALTER TABLE `aviao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `passagem`
--
ALTER TABLE `passagem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aviao`
--
ALTER TABLE `aviao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `passagem`
--
ALTER TABLE `passagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
