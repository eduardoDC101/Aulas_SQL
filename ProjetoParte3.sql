CREATE TABLE Fornecedor(
	cnpjFor VARCHAR(20) NOT NULL,
	contato VARCHAR(13) NOT NULL,
	prazo DATE,
	IE VARCHAR(20) NOT NULL,
	CONSTRAINT pk_fornecdor PRIMARY KEY (cnpjFor)
);
SELECT * FROM Fornecedor;

CREATE TABLE Farmacia(
	cnpjFar VARCHAR(20) NOT NULL,
	nomeFar VARCHAR(50) NOT NULL,
	nro INTEGER NOT NULL,
	rua VARCHAR NOT NULL,
	cep VARCHAR(11) NOT NULL,
	bairro VARCHAR(50) NOT NULL,
	CONSTRAINT pk_farmacia PRIMARY KEY (cnpjFar)
);
SELECT * FROM Farmacia;

CREATE TABLE Cliente(
	idCli INTEGER NOT NULL,
	nome VARCHAR(50) NOT NULL,
	cpf VARCHAR(15) NOT NULL,
	nro INTEGER NOT NULL,
	rua VARCHAR(80) NOT NULL,
	cep VARCHAR(11) NOT NULL,
	bairro VARCHAR(50) NOT NULL,
	CONSTRAINT unique_cpf_cliente UNIQUE (cpf),
	CONSTRAINT pk_cliente PRIMARY KEY (idCli)
);
SELECT * FROM Cliente;

CREATE TABLE Funcionario(
	idFun INTEGER NOT NULL,
	nome VARCHAR(50) NOT NULL,
	telefone VARCHAR(13) NOT NULL,
	cpf VARCHAR(15) NOT NULL,
	nro INTEGER NOT NULL,
	rua VARCHAR(50) NOT NULL,
	cep VARCHAR(11) NOT NULL,
	bairro VARCHAR(50) NOT NULL,
	cnpjFar VARCHAR(20) NOT NULL,
	CONSTRAINT unique_cpf_funcionario UNIQUE (cpf),
	CONSTRAINT fk_funcionrio_farmacia FOREIGN KEY (cnpjFar) REFERENCES Farmacia,
	CONSTRAINT pk_funcionario PRIMARY KEY (idFun)
);
SELECT * FROM Funcionario;

CREATE TABLE Medicamento(
	idMed INTEGER NOT NULL,
	lote INTEGER NOT NULL,
	validade DATE NOT NULL,
	nivel_estoq INTEGER NOT NULL,
	nome VARCHAR(50) NOT NULL,
	cnpjFar VARCHAR(20) NOT NULL,
	cnpjFor VARCHAR(20) NOT NULL,
	CONSTRAINT pk_medicamento PRIMARY KEY (idMed),
	CONSTRAINT fk_medicamento_farmacia FOREIGN KEY (cnpjFar) REFERENCES Farmacia,
	CONSTRAINT fk_medicamento_fornecedor FOREIGN KEY (cnpjFor) REFERENCES Fornecedor
);
SELECT * FROM Medicamento;

CREATE TABLE Venda(
	codVenda INTEGER NOT NULL,
	dataVenda DATE NOT NULL,
	total INTEGER NOT NULL,
	idCli INTEGER NOT NULL,
	idFun INTEGER NOT NULL,
	CONSTRAINT pk_venda PRIMARY KEY (codVenda),
	CONSTRAINT fk_venda_cliente FOREIGN KEY (idCli) REFERENCES Cliente,
	CONSTRAINT fk_venda_funcionario FOREIGN KEY (idFun) REFERENCES Funcionario
);
SELECT * FROM Venda;

CREATE TABLE medicamentoVenda(
	idMed INTEGER NOT NULL,
	codVenda INTEGER NOT NULL,
	CONSTRAINT pk_medicamentoVenda PRIMARY KEY (idMed, codVenda),
	CONSTRAINT fk_medicamentoVenda_Medica FOREIGN KEY (idMed) REFERENCES Medicamento,
	CONSTRAINT fk_medicamentoVenda_Venda FOREIGN KEY (codVenda) REFERENCES Venda
);
SELECT * FROM medicamentoVenda;

CREATE TABLE telefoneCli(
	telefone VARCHAR(13) NOT NULL,
	idCli INTEGER NOT NULL,
	CONSTRAINT fk_telefoneCli_Cli FOREIGN KEY (idCli) REFERENCES Cliente,
	CONSTRAINT pk_telefoneCli PRIMARY KEY (telefone, idCli)
);
SELECT * FROM telefoneCli;

CREATE TABLE telefoneFar(
	telefone VARCHAR(13) NOT NULL,
	cnpjFar VARCHAR(20) NOT NULL,
	CONSTRAINT fk_telefoneFar_Far FOREIGN KEY (cnpjFar) REFERENCES Farmacia,
	CONSTRAINT pk_telefoneFar PRIMARY KEY (telefone, cnpjFar)
);
SELECT * FROM telefoneFar;


