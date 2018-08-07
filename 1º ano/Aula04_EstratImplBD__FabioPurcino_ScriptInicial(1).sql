CREATE TABLE T_AU4_AUTOR(
  cd_codigo INTEGER NOT NULL,
  nm_autor VARCHAR(50),
  PRIMARY KEY (cd_codigo)
);

CREATE TABLE T_AU4_LIVRO(
  cd_codigo INTEGER NOT NULL,
  tx_titulo VARCHAR(200),
  nr_numero_paginas INTEGER,
  nr_ano_publicacao INTEGER,
  nr_edicao INTEGER,
  cd_codigo_autor INTEGER,
  PRIMARY KEY (cd_codigo),
  FOREIGN KEY (cd_codigo_autor) REFERENCES T_AU4_AUTOR(cd_codigo)
);
  
CREATE TABLE T_AU4_LIVRARIA(
  cd_livraria INTEGER NOT NULL,
  nm_livraria VARCHAR(50),
  tx_endereco VARCHAR(100),
  nr_numeroendereco INTEGER,
  tx_bairro VARCHAR(50),
  tx_cep VARCHAR(9),
  PRIMARY KEY(cd_livraria)
);
--criar tabela livraria
CREATE TABLE T_AU4_LIVRO_LIVRARIA(
  cd_codigo INTEGER NOT NULL,
  cd_livraria INTEGER NOT NULL,
  PRIMARY KEY(cd_codigo, cd_livraria),
  FOREIGN KEY(cd_codigo) REFERENCES T_AU4_LIVRO(cd_codigo),
  FOREIGN KEY(cd_livraria) REFERENCES T_AU4_LIVRARIA(cd_livraria)
);

ALTER TABLE T_AU4_LIVRO_LIVRARIA
ADD sg_status CHAR(1)
ADD vl_quantidade INTEGER
ADD vl_preco NUMBER(9,2);






