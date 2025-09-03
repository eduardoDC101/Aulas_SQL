CREATE TABLE EMPREGADO(
	idEmp integer PRIMARY KEY,
	pNome character varying (20) NOT NULL, 
	sNome character varying(20) NOT NULL, 
	idade integer, salario real NOT NULL, 
	cargo character varying(30) NOT NULL
);

INSERT INTO empregado VALUES (1,'Carlos','Alberto',24,2500,'Técnico em Segurança');
INSERT INTO empregado VALUES (2,'Pedro','Augusto',32,3500,'Analista de Sistemas');
INSERT INTO empregado VALUES (3,'Mara','Antonia',27,1200,'Secretária');
INSERT INTO empregado VALUES (4,'Derci','Gonçalves',56,6500,'Gerente');
INSERT INTO empregado VALUES (5,'Pedro','Bueno',28,1500,'Estagiário');
INSERT INTO empregado VALUES (6,'Edson','Arantes',60,7500,'Gerente');
INSERT INTO empregado VALUES (7,'Odete','Roitman',54,2000,'Técnico em Segurança');
INSERT INTO empregado VALUES (8,'Antonio','Da Lua',38,2500,'Analista de Sistemas');
INSERT INTO empregado VALUES (9,'Sassa','Mutema',55,3000,'Vendedor');
INSERT INTO empregado VALUES (10,'José','Silvério',42,2800,'Vendedor');
INSERT INTO empregado VALUES (11,'Gabriel','Oliveira',24,2500,'Técnico em Segurança');
INSERT INTO empregado VALUES (12,'Flávia','Camargo',29,4200,'Analista de Sistemas');
INSERT INTO empregado VALUES (13,'Marina','Delbonis',20,1000,'Secretária');
INSERT INTO empregado VALUES (14,'Paulo','Roberto',33,1500,'Vendedor');
INSERT INTO empregado VALUES (15,'José','Carlos da Silva',27,2900,'Analista de Sistemas');
INSERT INTO empregado VALUES (16,'Rúbia','Miranda',29,3500,'Administrador');
INSERT INTO empregado VALUES (17,'Roberto','Andrade Silva',35,3300,'Vendedor');
INSERT INTO empregado VALUES (18,'Ana','Julia',31,2900,'Secretária');
INSERT INTO empregado VALUES (19,'Pedro','Antonio',41,3500,'Administrador');
INSERT INTO empregado VALUES (20,'Ana','Mara',22,2200,'Psicóloga');
INSERT INTO empregado VALUES (21,'João','Augusto',44,5500,'Gerente');

-- LIKE 
-- Selecionar todos os nomes que iniciam com letra A:

SELECT pnome FROM empregado
	WHERE pnome LIKE 'A%';

-- Selecionar nomes que tenham letra A no nome
SELECT pnome FROM empregado
	WHERE pnome LIKE '%a%';

-- Selecionar todos os empregados que possuam a segunda letra 'e' no primeiro nome ou que tenham a penúltima letra
-- 'i'
SELECT pnome FROM empregado
	WHERE pnome LIKE '_e%' OR pnome LIKE '%i_';

-- Selecionar nomes que tenhma uma letra a e depois a letra s
SELECT pnome FROM empregado
	WHERE pnome LIKE '%a%s%';

SELECT pnome FROM empregado
	WHERE pnome LIKE '%a%' AND pnome LIKE '%s%';

-- Funções Agregadas
SELECT max(salario), min (salario), max(idade), min(idade) FROM empregado;

SELECT pnome, salario FROM empregado
	WHERE salario IN (SELECT max(salario) FROM empregado);

SELECT avg(salario), sum(salario) FROM empregado;

-- GROUP BY
SELECT cargo, salario FROM empregado ORDER BY cargo;

SELECT cargo FROM empregado ORDER BY cargo;


-- Gasto salarial de cada cargo, desde que os cargos tenham gastos acima de 10.000
SELECT cargo, sum(salario) FROM empregado
	GROUP BY cargo
	HAVING sum(salario) >10000;

SELECT cargo, max(salario), min(salario) FROM empregado
	WHERE cargo <> 'Gerente'
	GROUP BY cargo
	HAVING max(salario)> 2000 AND min(salario) < 2500;

select * from empregado;

