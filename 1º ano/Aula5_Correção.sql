--Ex1
UPDATE T_AU4_LIVRO_LIVRARIA 
SET sg_status = 'I'
WHERE vl_quantidade = 0;


--Ex2
UPDATE T_AU4_LIVRO_LIVRARIA
SET vl_preco = 0
WHERE sg_status = 'I';

--eX3
UPDATE T_AU4_LIVRO_LIVRARIA
SET vl_preco = vl_preco + vl_preco*0.05;


--Ex4
UPDATE T_AU4_LIVRO_LIVRARIA
SET vl_preco = vl_preco + vl_preco*0.10
WHERE cd_livraria = 1;

--Ex5
DELETE FROM T_AU4_LIVRO_LIVRARIA
WHERE cd_livraria = 3 AND vl_preco > 50;



