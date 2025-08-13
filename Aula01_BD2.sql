-- Craição da tabela Aluno (O campo que será Primarykey, sempre será not null, automático)
CREATE TABLE aluno(
	prontuario VARCHAR (15),
	nome VARCHAR (40) NOT NULL,
	idade INTEGER,
	CONSTRAINT pk_aluno PRIMARY KEY (prontuario)
);

-- Remover uma tabela
DROP TABLE aluno;

-- Inserir dados na tabela
INSERT INTO aluno VALUES('VP3029342', 'Carlos Almeida', 20);
-- ou inserir em colunas especificas
INSERT INTO aluno (prontuario, nome)
            VALUES ('VP3029441', 'João da Silva',21);
-- ou
INSERT INTO aluno (prontuario, idade, nome)
            VALUES ('VP3029481', 21, 'João da Silva'),
                   ('VP2032125', 19, 'José Pedro');

-- Atualizar coluna com um novo valor (aceita condições do where)
UPDATE aluno SET nome='Heitor Covalsck'
		WHERE prontuario = 'VP3029441';
-- ou
UPDATE aluno SET nome='Heitor Covalsck'
		WHERE prontuario = 'VP3029441' AND idade=21;
-- ou
UPDATE aluno SET idade=23
		WHERE nome ='José Pedro' or nome='Carlos Almeida';

--ou
UPDATE aluno SET nome='Heitor Camorra', idade=51
		WHERE prontuario = 'VP3029441';

-- Deletar tabela inteira
DELETE FROM aluno;


