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



-- =======================================================
-- INSERÇÕES DE DADOS
-- =======================================================

--FORNECEDORES
INSERT INTO Fornecedor (cnpjFor, contato, prazo, IE)
VALUES 
('11.111.111/0001-11', '17999999999', '2025-12-31', 'ISENTO'),
('22.222.222/0001-22', '17988888888', '2025-11-20', '123456789'),
('33.333.333/0001-33', '17977777777', '2026-01-15', '987654321');

--FARMÁCIAS
INSERT INTO Farmacia (cnpjFar, nomeFar, nro, rua, cep, bairro)
VALUES
('44.444.444/0001-44', 'Farmácia Central', 120, 'Rua das Flores', '15500-000', 'Centro'),
('55.555.555/0001-55', 'Drogaria Saúde', 45, 'Av. Brasil', '15502-111', 'Vila Nova'),
('66.666.666/0001-66', 'Farmácia Bem Estar', 230, 'Rua Goiás', '15501-222', 'São José');

--CLIENTES
INSERT INTO Cliente (idCli, nome, cpf, nro, rua, cep, bairro)
VALUES
(1, 'Natanael Pereira', '111.222.333-44', 100, 'Rua Rio Branco', '15500-100', 'Centro'),
(2, 'Maria Oliveira', '555.666.777-88', 45, 'Rua Tocantins', '15501-200', 'Jardim Paulista'),
(3, 'João Silva', '999.888.777-66', 90, 'Av. Prestes Maia', '15502-300', 'Vila Nova');

--FUNCIONÁRIOS
INSERT INTO Funcionario (idFun, nome, telefone, cpf, nro, rua, cep, bairro, cnpjFar)
VALUES
(1, 'Ana Souza', '17991112222', '123.456.789-00', 12, 'Rua das Acácias', '15500-500', 'Centro', '44.444.444/0001-44'),
(2, 'Carlos Pereira', '17992223333', '987.654.321-00', 45, 'Av. Santos Dumont', '15501-333', 'São José', '55.555.555/0001-55'),
(3, 'Fernanda Lima', '17993334444', '111.222.333-00', 80, 'Rua Bahia', '15502-444', 'Vila Nova', '66.666.666/0001-66');

--MEDICAMENTOS
INSERT INTO Medicamento (idMed, lote, validade, nivel_estoq, nome, cnpjFar, cnpjFor)
VALUES
(1, 12345, '2026-06-15', 50, 'Paracetamol 500mg', '44.444.444/0001-44', '11.111.111/0001-11'),
(2, 67890, '2026-03-20', 30, 'Amoxicilina 500mg', '55.555.555/0001-55', '22.222.222/0001-22'),
(3, 24680, '2027-01-01', 40, 'Dipirona 1g', '66.666.666/0001-66', '33.333.333/0001-33');

--VENDAS
INSERT INTO Venda (codVenda, dataVenda, total, idCli, idFun)
VALUES
(1, '2025-11-01', 45, 1, 1),
(2, '2025-11-05', 80, 2, 2),
(3, '2025-11-10', 25, 3, 3);

--MEDICAMENTO-VENDA
INSERT INTO medicamentoVenda (idMed, codVenda)
VALUES
(1, 1),
(2, 2),
(3, 3);

--TELEFONES CLIENTES
INSERT INTO telefoneCli (telefone, idCli)
VALUES
('17990001111', 1),
('17990002222', 2),
('17990003333', 3);

--TELEFONES FARMÁCIAS
INSERT INTO telefoneFar (telefone, cnpjFar)
VALUES
('1732221111', '44.444.444/0001-44'),
('1733332222', '55.555.555/0001-55'),
('1734443333', '66.666.666/0001-66');
