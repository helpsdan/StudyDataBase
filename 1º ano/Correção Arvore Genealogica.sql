CREATE TABLE T_AU7_PESSOA(
  cd_pessoa INTEGER PRIMARY KEY,
  nm_pessoa VARCHAR2(100),
  cd_pai INTEGER,
  cd_mae INTEGER
);

ALTER TABLE T_AU7_PESSOA
ADD CONSTRAINT FK_PAI
FOREIGN KEY(cd_pai) REFERENCES T_AU7_PESSOA(cd_pessoa);

ALTER TABLE T_AU7_PESSOA
ADD CONSTRAINT FK_MAE
FOREIGN KEY(cd_mae) REFERENCES T_AU7_PESSOA(cd_pessoa);

DELETE FROM T_AU7_PESSOA;

--Cadastrando linha dos avós
INSERT INTO T_AU7_PESSOA(cd_pessoa, nm_pessoa)
VALUES (1,'José');

INSERT INTO T_AU7_PESSOA(cd_pessoa, nm_pessoa)
VALUES (2,'Maria');

INSERT INTO T_AU7_PESSOA(cd_pessoa, nm_pessoa)
VALUES (3,'Roberto');

INSERT INTO T_AU7_PESSOA(cd_pessoa, nm_pessoa)
VALUES (4,'Marta');

INSERT INTO T_AU7_PESSOA(cd_pessoa, nm_pessoa, cd_pai, cd_mae)
VALUES(5,'Sueli',1,2);

INSERT INTO T_AU7_PESSOA(cd_pessoa, nm_pessoa, cd_pai, cd_mae)
VALUES(6,'Marcio',3,4);

INSERT INTO T_AU7_PESSOA(cd_pessoa, nm_pessoa, cd_pai, cd_mae)
VALUES(7,'Mariana',3,4);

INSERT INTO T_AU7_PESSOA(cd_pessoa, nm_pessoa, cd_pai, cd_mae)
VALUES(8,'Elias',6,5);

SELECT * FROM T_AU7_PESSOA;

SELECT P.nm_pessoa, PAIS.nm_pessoa, MAES.nm_pessoa
FROM T_AU7_PESSOA P
JOIN T_AU7_PESSOA PAIS ON PAIS.cd_pessoa = P.cd_pai
JOIN T_AU7_PESSOA MAES ON MAES.cd_pessoa = P.cd_mae












