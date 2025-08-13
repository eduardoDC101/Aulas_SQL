-- Craição da tabela Aluno (O campo que será Primarykey, sempre será not null, automático)
CREATE TABLE aluno(
	prontuario VARCHAR (15),
	nomeAluno VARCHAR (40) NOT NULL,
	idade INTEGER,
	CONSTRAINT pk_aluno PRIMARY KEY (prontuario)
);

-- Remover uma tabela
DROP TABLE aluno;

-- Inserir dados na tabela
INSERT INTO aluno('VP3029342', 'Carlos Almeida', 20);
-- ou inserir em colunas especificas
INSERT INTO aluno (prontuario, nomeAluno)
            VALUES ('VP3029481', 'João da Silva');
-- ou
INSERT INTO aluno (prontuario, idade, nomeAluno)
            VALUES ('VP3029481', 21, 'João da Silva');
