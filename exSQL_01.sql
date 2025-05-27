SELECT * FROM carro

INSERT INTO carro VALUES ('R12345', 'FH12K', 'Gol', 2012, 12.200),
						 ('R12335', 'FH12K', 'Vectra', 2022, 22.200),
						 ('R12315', 'FHf2K', 'Uno', 2002, 14.200),
						 ('R13345', 'FH1dK', 'Celta', 2024, 75.200),
						 ('R12545', 'FH13K', 'Palio', 2012, 52.600),
						 ('R15345', 'FH19K', 'Palio', 2015, 15.200),
						 ('R16345', 'FH18K', 'Uno', 2018, 17.200),
						 ('R12845', 'FH17K', 'Celta', 2013, 14.200),
						 ('R12355', 'FH15K', 'BMW', 2012, 24.700),
						 ('R12375', 'FH14K', 'Corlla', 2000, 16.200);
SELECT marca, ano, preco FROM carro
			WHERE ano > 2015;

UPDATE CARRO SET preco = preco*1.5
    WHERE marca = 'Celta';   

DELETE FROM carro WHERE preco <20;