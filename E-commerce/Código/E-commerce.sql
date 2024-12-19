CREATE TABLE Boleto (
  idBoleto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Pedido_Cliente_idCliente INTEGER UNSIGNED NOT NULL,
  Pedido_idPedido INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idBoleto),
  INDEX Boleto_FKIndex1(Pedido_idPedido, Pedido_Cliente_idCliente)
);

CREATE TABLE Cartao (
  idCartao INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Numero_cartao INTEGER UNSIGNED NOT NULL,
  Data_validade DATE NOT NULL,
  CVV INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idCartao)
);

CREATE TABLE Cliente (
  idCliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  PJ BOOL NULL,
  Endereco VARCHAR(255) NOT NULL,
  Telefone INTEGER UNSIGNED NOT NULL,
  Email VARCHAR(255) NULL,
  PRIMARY KEY(idCliente)
);

CREATE TABLE Dados_catao (
  Pedido_Cliente_idCliente INTEGER UNSIGNED NOT NULL,
  Pedido_idPedido INTEGER UNSIGNED NOT NULL,
  Cartao_idCartao INTEGER UNSIGNED NOT NULL,
  Debito BOOL NOT NULL,
  PRIMARY KEY(Pedido_Cliente_idCliente, Pedido_idPedido, Cartao_idCartao),
  INDEX Pedido_has_Cartao_FKIndex1(Pedido_idPedido, Pedido_Cliente_idCliente),
  INDEX Pedido_has_Cartao_FKIndex2(Cartao_idCartao)
);

CREATE TABLE Entrega (
  idEntrega INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Pedido_Cliente_idCliente INTEGER UNSIGNED NOT NULL,
  Pedido_idPedido INTEGER UNSIGNED NOT NULL,
  Codigo_rastreio INTEGER UNSIGNED NOT NULL,
  Status_entrega VARCHAR(255) NOT NULL,
  PRIMARY KEY(idEntrega, Pedido_Cliente_idCliente, Pedido_idPedido),
  INDEX Entrega_FKIndex1(Pedido_idPedido, Pedido_Cliente_idCliente)
);

CREATE TABLE Estoque (
  idEstoque INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Local_estoque VARCHAR(255) NULL,
  PRIMARY KEY(idEstoque)
);

CREATE TABLE Estoque_has_Produto (
  Estoque_idEstoque INTEGER UNSIGNED NOT NULL,
  Produto_idProduto INTEGER UNSIGNED NOT NULL,
  Quantidade INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Estoque_idEstoque, Produto_idProduto),
  INDEX Estoque_has_Produto_FKIndex1(Estoque_idEstoque),
  INDEX Estoque_has_Produto_FKIndex2(Produto_idProduto)
);

CREATE TABLE Fornecedor (
  idFornecedor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(idFornecedor)
);

CREATE TABLE Fornecedor_has_Produto (
  Fornecedor_idFornecedor INTEGER UNSIGNED NOT NULL,
  Produto_idProduto INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Fornecedor_idFornecedor, Produto_idProduto),
  INDEX Fornecedor_has_Produto_FKIndex1(Fornecedor_idFornecedor),
  INDEX Fornecedor_has_Produto_FKIndex2(Produto_idProduto)
);

CREATE TABLE Pedido (
  idPedido INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Cliente_idCliente INTEGER UNSIGNED NOT NULL,
  Endereco_entrega VARCHAR(255) NOT NULL,
  Status_pedido VARCHAR(255) NOT NULL,
  Frete FLOAT NOT NULL,
  Forma_pagamento INTEGER UNSIGNED NOT NULL,
  Cancelado BOOL NULL,
  PRIMARY KEY(idPedido, Cliente_idCliente),
  INDEX Pedido_FKIndex1(Cliente_idCliente)
);

CREATE TABLE Pedido_has_Produto (
  Pedido_idPedido INTEGER UNSIGNED NOT NULL,
  Produto_idProduto INTEGER UNSIGNED NOT NULL,
  Pedido_Cliente_idCliente INTEGER UNSIGNED NOT NULL,
  Quantidade INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Pedido_idPedido, Produto_idProduto, Pedido_Cliente_idCliente),
  INDEX Pedido_has_Produto_FKIndex1(Pedido_idPedido, Pedido_Cliente_idCliente),
  INDEX Pedido_has_Produto_FKIndex2(Produto_idProduto)
);

CREATE TABLE PF (
  CPF INTEGER UNSIGNED NOT NULL,
  Cliente_idCliente INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(CPF),
  INDEX PF_FKIndex1(Cliente_idCliente)
);

CREATE TABLE PIX (
  idPIX INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Pedido_Cliente_idCliente INTEGER UNSIGNED NOT NULL,
  Pedido_idPedido INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idPIX),
  INDEX PIX_FKIndex1(Pedido_idPedido, Pedido_Cliente_idCliente)
);

CREATE TABLE PJ (
  CNPJ INTEGER UNSIGNED NOT NULL,
  Cliente_idCliente INTEGER UNSIGNED NOT NULL,
  Inscricao_estadual INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(CNPJ),
  INDEX PJ_FKIndex1(Cliente_idCliente)
);

CREATE TABLE Produto (
  idProduto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Categoria VARCHAR(45) NOT NULL,
  Descricao VARCHAR(255) NOT NULL,
  Valor FLOAT NOT NULL,
  PRIMARY KEY(idProduto)
);

CREATE TABLE Produto_has_Vendedor (Terceiro) (
  Produto_idProduto INTEGER UNSIGNED NOT NULL,
  Vendedor (Terceiro)_idVendedor_T INTEGER UNSIGNED NOT NULL,
  Quantidade INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Produto_idProduto, Vendedor (Terceiro)_idVendedor_T),
  INDEX Produto_has_Vendedor (Terceiro)_FKIndex1(Produto_idProduto),
  INDEX Produto_has_Vendedor (Terceiro)_FKIndex2(Vendedor (Terceiro)_idVendedor_T)
);

CREATE TABLE Vendedor (Terceiro) (
  idVendedor_T INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Razzo_social VARCHAR(255) NOT NULL,
  CNPJ INTEGER UNSIGNED NOT NULL,
  Local_vendedor INTEGER UNSIGNED NULL,
  PRIMARY KEY(idVendedor_T)
);
