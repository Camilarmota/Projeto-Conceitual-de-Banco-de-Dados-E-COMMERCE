CREATE TABLE IF NOT EXISTS `Clientes` (
	`IdCliente` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Nome` varchar(45) NOT NULL,
	`PJ/PF` varchar(45) NOT NULL,
	`Endereco` varchar(45) NOT NULL,
	`Email` varchar(45) NOT NULL,
	PRIMARY KEY (`IdCliente`)
);

CREATE TABLE IF NOT EXISTS `Pedido` (
	`IdPedido` int AUTO_INCREMENT NOT NULL UNIQUE,
	`IdCliente` int NOT NULL,
	`StatusPedido` varchar(255) NOT NULL,
	`Descricao` varchar(255) NOT NULL,
	`Frete` float NOT NULL,
	`Rastreio` varchar(255) NOT NULL,
	`DataPedido` datetime NOT NULL,
	`DataEnvio` datetime NOT NULL,
	PRIMARY KEY (`IdPedido`)
);

CREATE TABLE IF NOT EXISTS `Fornecedor` (
	`IdFornecedor` int AUTO_INCREMENT NOT NULL UNIQUE,
	`RazaoSocial` int AUTO_INCREMENT NOT NULL UNIQUE,
	`CNPJ` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Email` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Telefone` int AUTO_INCREMENT NOT NULL UNIQUE,
	PRIMARY KEY (`IdFornecedor`)
);

CREATE TABLE IF NOT EXISTS `Produto` (
	`IdProduto` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Categoria` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Descricao` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Valor` int AUTO_INCREMENT NOT NULL UNIQUE,
	PRIMARY KEY (`IdProduto`)
);

CREATE TABLE IF NOT EXISTS `Estoque` (
	`IdEstoque` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Local` varchar(45) NOT NULL,
	PRIMARY KEY (`IdEstoque`)
);

CREATE TABLE IF NOT EXISTS `Produto_Disponível` (
	`IdFornecedor` int AUTO_INCREMENT NOT NULL UNIQUE,
	`IdProduto` int AUTO_INCREMENT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `Produto_Estoque` (
	`IdProduto` int AUTO_INCREMENT NOT NULL UNIQUE,
	`IdEstoque` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Quantidade` int AUTO_INCREMENT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `Relacao_Produto_Pedido` (
	`IdPedido` int AUTO_INCREMENT NOT NULL UNIQUE,
	`IdProduto` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Quantidade` int AUTO_INCREMENT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS `Pagamento` (
	`IdPagamento` int NOT NULL DEFAULT '11',
	`IdPedido` int NOT NULL,
	`DataPagamento` datetime NOT NULL,
	`ValorPago` decimal(10,0) NOT NULL,
	`MetodoPagamento` varchar(255) NOT NULL DEFAULT '50',
	PRIMARY KEY (`IdPagamento`)
);


ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_fk1` FOREIGN KEY (`IdCliente`) REFERENCES `Clientes`(`IdCliente`);



ALTER TABLE `Produto_Disponível` ADD CONSTRAINT `Produto_Disponível_fk0` FOREIGN KEY (`IdFornecedor`) REFERENCES `Fornecedor`(`IdFornecedor`);

ALTER TABLE `Produto_Disponível` ADD CONSTRAINT `Produto_Disponível_fk1` FOREIGN KEY (`IdProduto`) REFERENCES `Produto`(`IdProduto`);
ALTER TABLE `Produto_Estoque` ADD CONSTRAINT `Produto_Estoque_fk0` FOREIGN KEY (`IdProduto`) REFERENCES `Produto`(`IdProduto`);

ALTER TABLE `Produto_Estoque` ADD CONSTRAINT `Produto_Estoque_fk1` FOREIGN KEY (`IdEstoque`) REFERENCES `Estoque`(`IdEstoque`);
ALTER TABLE `Relacao_Produto_Pedido` ADD CONSTRAINT `Relacao_Produto_Pedido_fk0` FOREIGN KEY (`IdPedido`) REFERENCES `Pedido`(`IdPedido`);

ALTER TABLE `Relacao_Produto_Pedido` ADD CONSTRAINT `Relacao_Produto_Pedido_fk1` FOREIGN KEY (`IdProduto`) REFERENCES `Produto`(`IdProduto`);
ALTER TABLE `Pagamento` ADD CONSTRAINT `Pagamento_fk1` FOREIGN KEY (`IdPedido`) REFERENCES `Pedido`(`IdPedido`);