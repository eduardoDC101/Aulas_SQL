--Restrições 

--Check: Antes de um valor ser inserido, confere-se se ele está de acordo a uma determinada condição.
--Ex:Criar uma tabela que só permite inserir empréstimos com valores maiores que 100.

CREATE TABLE emprestimo(
	nome_age_emp varchar(15) NOT NULL,
	numero_emp varchar(10) NOT NULL,
	valor_emp numeric(10,2),
	CONSTRAINT pk_emprestimo PRIMARY KEY (numero_emp),
	CONSTRAINT ck_emprestimo_valor CHECK (valor_emp > 100));

INSERT INTO emprestimo
	VALUES ('Votuporanga', '11A', 150);

SELECT * FROM emprestimo;
----------------------------------------------------------------
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
-----------------------------------------------------------------------------
--EX2: Criar uma tabela cliente e verifique se o estado do cliente é SP ou MG:
CREATE TABLE cliente(
	codigo INTEGER,
	nome varchar(40),
	estado char(2),
	CONSTRAINT ck_cliente estado CHECK (estado IN (‘SP’ , ‘MG’)));
------------------------------------------------------------------------------
--UNIQUE
-- Garantir que colunas não chave primária (chaves candidatas) tenham valores únicos.

CREATE TABLE aluno(
	prontuario varchar(15),
	nome varchar(40),
	cpf varchar(12),
	CONSTRAINT pk_aluno PRIMARY KEY (prontuario),
    CONSTRAINT un_aluno_cpf UNIQUE (cpf)
);

INSERT INTO aluno VALUES ('11AA', 'Rafael', '123.345-55');
-------------------------------------------------------------
--EX1:

CREATE TABLE pessoa(
	id INTEGER NOT NULL,
	pNome VARCHAR(50),
	sNome VARCHAR(50),
	email VARCHAR(30),
	CONSTRAINT pk_idPessoa PRIMARY KEY (id),
	CONSTRAINT un_email_pess UNIQUE (email)
);
-------------------------------------------------------/
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
---------------------------------------------------------------------------------------------
--EX3
CREATE TABLE livro(
	idLivro INTEGER NOT NULL,
	titulo VARCHAR(50) NOT NULL,
	ISBN VARCHAR(20),
	dtaPublic DATE,
	CONSTRAINT pk_livro PRIMARY KEY (idLivro),
	CONSTRAINT un_isbn_livro UNIQUE (ISBN)
);
------------------------------------------------------------
--EX4:

CREATE TABLE carro(
	idCarro INTEGER NOT NULL,
	modelo VARCHAR(30),
	marca VARCHAR(50),
	ano DATE,
	preco REAL,
	chassi VARCHAR(30),
	renavam VARCHAR(30),
	CONSTRAINT pk_idCarro PRIMARY KEY (idCarro),
	CONSTRAINT un_chassi_car UNIQUE (chassi),
	CONSTRAINT un_renavem_car UNIQUE (renavam),
	CONSTRAINT chk_preco_carro CHECK (preco > 2000)
);










