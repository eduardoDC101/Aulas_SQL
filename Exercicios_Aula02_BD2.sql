  CREATE TABLE Curso(
	idCurso INTEGER,
	nomeCurso VARCHAR(30),
	nroSemestres INTEGER,
	dtaFundacao DATE,
	CONSTRAINT pk_curso PRIMARY KEY (idCurso)
);

CREATE TABLE Aluno(
	prontuario VARCHAR(30),
	nomeAluno VARCHAR(30),
	dtaNasc DATE,
	sexo char(1),
	idCurso INTEGER, 
	CONSTRAINT pk_aluno PRIMARY KEY (prontuario),
	CONSTRAINT fk_aluno_curso FOREIGN KEY (idCurso) REFERENCES Curso
);


INSERT INTO curso
		VALUES (1, 'Ciência da Computação', 8, '01/03/1986'),
		       (2, 'Direito', 8, '01/03/1975'),
			   (3, 'Medicina', 12, '01/03/2000'),
			   (4, 'Engenharia Elétrica', 10, '01/03/1996'),
			   (5, 'Biologia', 8, '01/03/1993'),
			   (6, 'Matemática', 8, '01/03/1968');

INSERT INTO Aluno
		VALUES  ('11aa', 'Paulo', '01/07/1986', 'M', 1),
				('11bb', 'Ana', '08/07/1990', 'F', 5),
				('11cc', 'Júlio', '08/05/1980', 'M', 3),
				('11dd', 'Carlos', '10/11/1983', 'M', 2),
				('11ee', 'Gabriele', '08/05/1990', 'F', 3),
				('11ff', 'Antônio', '15/06/1955', 'M', 4),
				('11gg', 'Ana', '08/12/1975', 'F', 5),
				('11hh', 'Mara', '07/07/1970', 'F', 1),
				('11ii', 'Roberto', '01/07/1956', 'M', 3),
				('11jj', 'Carmen', '03/02/1950', 'F', 2);


INSERT INTO Aluno
		VALUES  ('11kk', 'Pedro', '01/07/1946', 'M', 3);

UPDATE curso SET idCurso = 10
		WHERE idCurso=3;

ALTER TABLE aluno DROP CONSTRAINT fk_aluno_curso;
ALTER TABLE aluno ADD CONSTRAINT fk_aluno_curso
		FOREIGN KEY (idCurso) REFERENCES curso ON UPDATE CASCADE

UPDATE aluno SET nomeAluno = 'Ana Paula'
       WHERE prontuario = '11gg'

SELECT * FROM Curso;
SELECT * FROM Aluno;
