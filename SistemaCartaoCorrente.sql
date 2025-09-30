CREATE TABLE Correntista(
	cpfCorrentista VARCHAR(14) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	CONSTRAINT pk_correntista PRIMARY KEY (cpfCorrentista)
);

/*--------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE ContaCorrente(
	numConta INTEGER NOT NULL,
	saldo NUMERIC(9,2),
	CONSTRAINT pk_contaCorrente PRIMARY KEY (numConta)
);

/*--------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE Tem(
	cpfCorrentista VARCHAR(14) NOT NULL,
	numConta INTEGER NOT NULL,
	CONSTRAINT pk_tem PRIMARY KEY (cpfCorrentista, numConta),
	CONSTRAINT fk_tem_correntista FOREIGN KEY (cpfCorrentista) REFERENCES Correntista ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_tem_contacorrente FOREIGN KEY (numConta) REFERENCES ContaCorrente ON DELETE CASCADE ON UPDATE CASCADE
);

/*--------------------------------------------------------------------------------------------------------------------------*/

CREATE TABLE Cartao(
	numCartao INTEGER NOT NULL,
	cpfCorrentista VARCHAR(14) NOT NULL,
	numConta INTEGER NOT NULL,
	limite NUMERIC(8,2) NOT NULL,
	CONSTRAINT pk_cartao PRIMARY KEY (numCartao),
	CONSTRAINT fk_cartao_tem FOREIGN KEY (cpfCorrentista, numConta) REFERENCES Tem ON DELETE CASCADE ON UPDATE CASCADE
);

/*--------------------------------------------------------------------------------------------------------------------------*/

INSERT INTO Correntista VALUES ('111.111.111-11', 'Ana Amaral'),
                               ('222.222.222-22', 'Bianca Boston'),
							   ('333.333.333-33', 'Carlos Carrasco'),
							   ('444.444.444-44', 'Daniel Donda');

INSERT INTO ContaCorrente VALUES (111, 34034.13),
                                 (222, 543039.12),
							     (333, 4944231.12);

INSERT INTO Tem VALUES ('111.111.111-11', 111),
					   ('222.222.222-11', 111),
					   ('333.333.333-33', 222),
					   ('444.444.444-44', 333);

INSERT INTO Cartao VALUES (123321, '111.111.111-11', 111, 10000.00),
					      (432234, '333.333.333-33', 222, 200000.00),
					      (766667, '444.444.444-44', 333, 135000.00);

/*--------------------------------------------------------------------------------------------------------------------------*/

SELECT * FROM Correntista;
SELECT * FROM ContaCorrente;
SELECT * FROM Tem;
SELECT * FROM Cartao;
