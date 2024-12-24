CREATE TABLE Cliente (
  idCliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  nResidencia INT NULL,
  rua VARCHAR(255) NOT NULL,
  Bairro VARCHAR(255) NOT NULL,
  complemento VARCHAR(45) NULL,
  cidade VARCHAR(255) NOT NULL,
  estadoSigla VARCHAR(20) NOT NULL,
  numeroCelular INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idCliente)
);

CREATE TABLE Equipe (
  idEquipe INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(idEquipe)
);

CREATE TABLE Equipe_Mecanico (
  Mecanico_idMecanico INTEGER UNSIGNED NOT NULL,
  Equipe_idEquipe INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Mecanico_idMecanico, Equipe_idEquipe),
  INDEX Mecanico_has_Equipe_FKIndex1(Mecanico_idMecanico),
  INDEX Mecanico_has_Equipe_FKIndex2(Equipe_idEquipe)
);

CREATE TABLE Mecanico (
  idMecanico INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  endereco VARCHAR(255) NOT NULL,
  especialidade VARCHAR(255) NOT NULL,
  PRIMARY KEY(idMecanico)
);

CREATE TABLE OrdemServico (
  idOrdemServico INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Equipe_idEquipe INTEGER UNSIGNED NOT NULL,
  dataEmissao DATETIME NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  status_2 VARCHAR(45) NOT NULL,
  dataConclusao DATE NOT NULL,
  PRIMARY KEY(idOrdemServico, Equipe_idEquipe),
  INDEX OrdemServico_FKIndex1(Equipe_idEquipe)
);

CREATE TABLE principalCervico_outros (
  OrdemServico_idOrdemServico INTEGER UNSIGNED NOT NULL,
  tabelaPreco_idtabelaPreco INTEGER UNSIGNED NOT NULL,
  OrdemServico_Equipe_idEquipe INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(OrdemServico_idOrdemServico, tabelaPreco_idtabelaPreco, OrdemServico_Equipe_idEquipe),
  INDEX OrdemServico_has_tabelaPreco_FKIndex1(OrdemServico_idOrdemServico, OrdemServico_Equipe_idEquipe),
  INDEX OrdemServico_has_tabelaPreco_FKIndex2(tabelaPreco_idtabelaPreco)
);

CREATE TABLE tabelaPreco (
  idtabelaPreco INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  valor FLOAT NOT NULL,
  PRIMARY KEY(idtabelaPreco)
);

CREATE TABLE Veiculo (
  idVeiculo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Cliente_idCliente INTEGER UNSIGNED NOT NULL,
  Equipe_idEquipe INTEGER UNSIGNED NOT NULL,
  placa VARCHAR(20) NOT NULL,
  marca VARCHAR(45) NOT NULL,
  modelo VARCHAR(45) NOT NULL,
  PRIMARY KEY(idVeiculo, Cliente_idCliente, Equipe_idEquipe),
  INDEX Veiculo_FKIndex1(Cliente_idCliente),
  INDEX Veiculo_FKIndex2(Equipe_idEquipe)
);
