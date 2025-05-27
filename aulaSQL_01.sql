CREATE TABLE carro
	(renavam VARCHAR (15),
	placa VARCHAR (10) NOT NULL,
	marca VARCHAR (50),
	ano INTEGER,
	preco REAL,
	CONSTRAINT pk_carro PRIMARY KEY (renavam)
	);
SELECT * FROM carro

-- Cria tabela aluno
CREATE TABLE aluno
	(prontuario_al VARCHAR (15),
	nome_al VARCHAR (40) NOT NUll,
	idade INTEGER,
	CONSTRAINT pk_aluno PRIMARY KEY (prontuario_al)
	);
SELECT * FROM aluno
-- Seleciona e mostra tudo da tabela aluno

CREATE TABLE pessoa
	(prontuario VARCHAR (15),
	nome VARCHAR (40) NOT NULL,
	idade INTEGER,
	CONSTRAINT pk_pessoa PRIMARY KEY (prontuario)
	);
SELECT * FROM pessoa

-- VARCHAR: uma char com caracteres especiais, tipo um CPF '490.930.939-12'
-- INTEGER: Int
-- REAL:  Reais

-- Exclui tabela pessoa
DROP TABLE pessoa;

-- Inserir na tabela aluno
INSERT INTO aluno VALUES ('vp3026975','Eduardo', 20);

SELECT * FROM aluno;

-- Inserindo vários dados:
INSERT INTO aluno VALUES ('vp3023453','Carlos', 17),
						 ('vp3024147','Pedro', 23),
						 ('vp3028789','Larissa', 19);

-- Outra meneira de Inserir:
INSERT INTO aluno (prontuario_al, nome_al, idade)
                VALUES ('VP13', 'Jurandir', 22);
-- Podemos colcoar em qualquer ordem, mas precisamos colocar os values na ordem certa do INSERT INTO