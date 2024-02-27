-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/02/2024 às 18:46
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `auth_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `valor` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `product`
--

INSERT INTO `product` (`id`, `uuid`, `nome`, `valor`, `quantidade`, `userId`, `createdAt`, `updatedAt`) VALUES
(4, 'dbdadc99-8e3c-44f5-92c9-227b6510907d', 'Produto 44', 150, 5, 1, '2024-02-26 22:17:33', '2024-02-26 23:16:03'),
(5, '619f70fb-cf65-42e7-91c9-18b3172d8ea3', 'Produto 5', 150, 5, 1, '2024-02-26 22:17:36', '2024-02-26 22:17:36'),
(6, '3caf6a4b-80f1-4329-9da4-3edb885a5115', 'Produto 6', 150, 5, 1, '2024-02-26 22:17:40', '2024-02-26 22:17:40'),
(8, '1f404403-c645-4bf4-9293-5acf7019ad48', 'Produto teste 1', 150, 10, 5, '2024-02-26 23:14:01', '2024-02-26 23:14:22'),
(9, 'f46e2e69-8e4c-459d-a2ba-f5cb4bf3f78e', 'Produto teste 2', 800, 40, 5, '2024-02-26 23:14:13', '2024-02-26 23:14:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessions`
--

CREATE TABLE `sessions` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sessions`
--

INSERT INTO `sessions` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('4NNAb00HNscvrobEkGZ5Lx31LsDucyI1', '2024-02-27 23:11:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:11:40', '2024-02-26 23:11:40'),
('601MVtRPdPnuYrtGChXkIwXNUBgbaVLG', '2024-02-27 23:06:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:06:08', '2024-02-26 23:06:08'),
('6cR5GzAXwkuHYe6DKzcy2jfKSL8sb8wU', '2024-02-27 22:45:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:45:18', '2024-02-26 22:45:18'),
('7CiSvqwXuxBB3iYRtaOwGw64e6Sz8biK', '2024-02-27 22:46:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:46:31', '2024-02-26 22:46:31'),
('9LVfgvnoSFBIaZobxVGGtzlCzvm6MCT4', '2024-02-27 22:45:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:45:28', '2024-02-26 22:45:28'),
('BslXRbp2PtZBidMxqqZYiixH2DrUqFgD', '2024-02-27 23:15:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:15:13', '2024-02-26 23:15:13'),
('BtL5Galv7UCxB5tVBSnA3nOUUoz1SOvr', '2024-02-27 23:24:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"899bdde3-29a2-47c4-a4af-45eda2c4c623\"}', '2024-02-26 23:15:20', '2024-02-26 23:24:23'),
('CWBgcWV2VRBWcC0Jxz23a5o4m5fGjDwn', '2024-02-27 22:43:39', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:43:39', '2024-02-26 22:43:39'),
('c_NrZFT_DXbOYU0-yQ_E1KeOxO_mkbLp', '2024-02-27 20:03:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 20:02:12', '2024-02-26 20:03:40'),
('dGbGQOI3YkhQEUo1xtEo5KprrK8wFQMn', '2024-02-27 22:44:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:44:24', '2024-02-26 22:44:24'),
('dhj9mPDmm1M-evMUJNdU6fBI245WStJV', '2024-02-27 23:15:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:15:03', '2024-02-26 23:15:03'),
('EC02OjhHXISQVPRh1v73LgYXrxdEB5uZ', '2024-02-27 23:11:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:11:07', '2024-02-26 23:11:07'),
('eNn6iMAm6wl7is5j37egzmvfPLZYWseI', '2024-02-27 22:52:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:52:30', '2024-02-26 22:52:30'),
('euMVxd39ToC5PInSjU_r8qLWMS3oDXFS', '2024-02-27 22:40:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:40:20', '2024-02-26 22:40:20'),
('fIckGlaCALFBgVVHq3hf6xnkXvOYXbcN', '2024-02-27 23:04:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:04:44', '2024-02-26 23:04:44'),
('Fqbbw4Ur77kjmCXiVfnU-c7IX66QPZHu', '2024-02-27 23:01:56', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:01:56', '2024-02-26 23:01:56'),
('gRjqqygmvYWbEqsfC0LUldUHvzH_nkft', '2024-02-27 22:43:32', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:43:32', '2024-02-26 22:43:32'),
('hBTVXmK4darcEogscbFp9J6mHVkzoM-t', '2024-02-27 22:43:51', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:43:51', '2024-02-26 22:43:51'),
('HDk_2M2x5iZKZwJ25wDYo9bICm3xpxb3', '2024-02-27 23:05:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:05:01', '2024-02-26 23:05:01'),
('J6AwvRsQmbimjYUKmpSe5vNx2iIB9j4u', '2024-02-27 22:43:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:43:58', '2024-02-26 22:43:58'),
('jPWSpcZG3-WCFxhTN3UTQXxPzfS7qWdz', '2024-02-27 23:14:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:14:13', '2024-02-26 23:14:13'),
('jzrVO-Pf1HDjdog97XbzZLBVhF_H8Yx4', '2024-02-27 22:47:09', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:47:09', '2024-02-26 22:47:09'),
('J__8Cm1dMMgZ5xKu6xm0eTwjsoV5vC1l', '2024-02-27 23:11:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:11:19', '2024-02-26 23:11:19'),
('kifpaPl20Cbn6suTRRZPc44G8lsSeRDf', '2024-02-27 23:05:39', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:05:39', '2024-02-26 23:05:39'),
('KmTux2Bt_wNnG5EDBdLuhViEQOQ0JMWX', '2024-02-27 22:52:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:52:44', '2024-02-26 22:52:44'),
('M4CebDdHHBgtM9vq7eeIMhbbt1ymNg-p', '2024-02-27 23:13:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:13:47', '2024-02-26 23:13:47'),
('O8VufA5r0a6dMqivPpGv2-DBJkoFQBua', '2024-02-27 22:34:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"03361861-101f-4193-9b91-f116290db1a3\"}', '2024-02-26 22:34:21', '2024-02-26 22:34:52'),
('pJ7vELCaChdR0CVIplRnbenEAIxYWxKC', '2024-02-27 23:00:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:00:12', '2024-02-26 23:00:12'),
('qjnzlgUu6scpYYJWO75gi8pqiXNPXpYj', '2024-02-27 23:05:51', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:05:51', '2024-02-26 23:05:51'),
('QWblUfUsQKFwBrl_TtgmZp2PA4bHzj_b', '2024-02-27 23:06:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:06:01', '2024-02-26 23:06:01'),
('rrSGkV0w2kLRo5vPRPed00XATlFqV4FM', '2024-02-27 23:13:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:13:41', '2024-02-26 23:13:41'),
('sYTaxPF9lcSttOmKudMztrBpNCu-3lg2', '2024-02-27 22:44:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:44:21', '2024-02-26 22:44:21'),
('tWInSddZErwiM6l7mZWzIZZ5zhV945N4', '2024-02-27 23:16:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:16:03', '2024-02-26 23:16:03'),
('UIa9JS3DUrpYkGcm5XmKdSMtX2VwJ-Wb', '2024-02-27 22:43:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:43:23', '2024-02-26 22:43:23'),
('UnMoXNRF0EkcPQtjoZFe_D211o87CYVq', '2024-02-27 23:14:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:14:01', '2024-02-26 23:14:01'),
('Uq26oAsbELe7AiRreyMnGPfwLr57B2gg', '2024-02-27 22:41:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:41:17', '2024-02-26 22:41:17'),
('UZ7CBxgKeHZKcLGbSRsRRH8SO7INXooa', '2024-02-27 23:14:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:14:18', '2024-02-26 23:14:18'),
('WxugCkSOsk0lz5X5QcxE7kJyS6_gsgT4', '2024-02-27 23:15:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:15:20', '2024-02-26 23:15:20'),
('y5zQ7_kv2HQJt-7NVxynECzrDmot65s-', '2024-02-27 22:37:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:37:52', '2024-02-26 22:37:52'),
('yBhAbMqn9NZVK_hZGZqDyVa0tCUlhBaK', '2024-02-27 23:15:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:15:12', '2024-02-26 23:15:12'),
('Yqk17NmVREZc30gK4IHk5IItkmNfC56_', '2024-02-27 19:59:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 18:32:13', '2024-02-26 19:59:29'),
('zARavmnTSJpSNynNO8ABzlLJWSCWpztd', '2024-02-27 22:54:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 22:54:20', '2024-02-26 22:54:20'),
('ZdyQ6wLgObIT4QQiIMRmyULtPveGAe4S', '2024-02-27 23:13:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:13:23', '2024-02-26 23:13:23'),
('_-e0s-_5YP0VN5por82g1ZKrONyzgdcO', '2024-02-27 23:14:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-02-26 23:14:46', '2024-02-26 23:14:46');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `uuid`, `nome`, `email`, `senha`, `cargo`, `createdAt`, `updatedAt`) VALUES
(1, '899bdde3-29a2-47c4-a4af-45eda2c4c623', 'Johnathan Amorim', 'leccorside@gmail.com', '$argon2id$v=19$m=4096,t=3,p=1$X2wUIGGRXETRS+91pjroyw$0KPLszKibM7JrF6XZROe2AXe98N9fOeab1u0cIvErHo', 'admin', '2024-02-26 20:23:35', '2024-02-26 23:15:12'),
(5, '2a7d1599-c372-4c19-9174-0c9a145ae9a2', 'Teste user', 'teste@gmail.com', '$argon2id$v=19$m=4096,t=3,p=1$PoBgmiw9Gp38Rnuj9Z2MCw$Gaklsiw+9O5eWuxBJ7UN4vhQojMMmjeoe5+9f3Iiwnc', 'user', '2024-02-26 23:13:23', '2024-02-26 23:13:23');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Índices de tabela `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
