CREATE TABLE emprestimo(
	nome_ag_emp VARCHAR(15) NOT NULL,
	numero_emp VARCHAR(10) NOT NULL,
	valor_emp NUMERIC(10, 2),
	CONSTRAINT pk_emprestimo PRIMARY KEY (numero_emp),
	CONSTRAINT chk_valor_emprestimo CHECK (valor_emp > 100)
);

INSERT INTO emprestimo
	VALUES ('Votuporanga', '11A', 150);

SELECT * FROM emprestimo;

--EX1:
CREATE TABLE empregado(
	idEmpregado INTEGER NOT NULL,
	pNome VARCHAR(50) NOT NULL,
	sNome VARCHAR(50) NOT NULL,
	dtaNasc DATE,
	dtaContr DATE,
	salario REAL,
	CONSTRAINT pk_empregado PRIMARY KEY (idEmpregado),
	CONSTRAINT chk_salario_empregado CHECK (salario > 400),
	CONSTRAINT chk_dtaNasc_empregado CHECK (dtaNasc > '01/01/2001'),
	CONSTRAINT chk_dtaNasc_empregado CHECK (((dtaContr - dtaNasc)/365 >= 18))
);

INSERT INTO empregado
	VALUES (111, 'Carlos', 'da Silva', '2005/03/03', '2026/04/02', 1518);

SELECT * FROM empregado;

--UNIQUE
CREATE TABLE aluno(
	prontuario VARCHAR(15),
	nome VARCHAR(40),
	cpf VARCHAR(12),
	CONSTRAINT pk_aluno PRIMARY KEY (prontuario),
	CONSTRAINT un_cpf_alu UNIQUE (cpf)
);

INSERT INTO aluno VALUES ('11AA', 'Rafael', '123.345-55');

-- EX2 
CREATE TABLE correntista(
	cpf INTEGER NOT NULL,
	nome VARCHAR(50) NOT NULL,
	data_nasc DATE NOT NULL,
	cidade VARCHAR(30),
	uf VARCHAR(3),
	CONSTRAINT pk_correntista PRIMARY KEY (cpf),
	CONSTRAINT chk_idade_correntista
			CHECK ((CURRENT_DATE - data_nasc)/365 >=18)
);

CREATE TABLE conta_corrente(
	numConta INTEGER NOT NULL,
	cpf_correntista INTEGER NOT NULL,
	saldo REAL,
	CONSTRAINT pk_conta_corrente PRIMARY KEY (numConta),
	CONSTRAINT fk_conta_correntista FOREIGN KEY (cpf_correntista) REFERENCES correntista,
	CONSTRAINT chk_saldo_corrente CHECK (saldo> 500)
);


