--ex1
SELECT
L.cd_ligacao,l.DT_LIGACAO,L.VL_MINUTOS,
A.NM_ATENDENTE,P.NM_PROBLEMA, L.NR_TELEFONE
FROM T_A09_ATENDENTE A
JOIN T_A09_LIGACAO L ON A.cd_atendente = L.cd_atendente
JOIN T_A09_PROBLEMA P ON L.cd_Problema = P.cd_problema

--EX2
SELECT
P.nm_problema, A.nm_atendente
FROM T_A09_ATENDENTE A
JOIN T_A09_LIGACAO L ON A.cd_atendente = L.cd_atendente
JOIN T_A09_PROBLEMA P ON L.cd_Problema = P.cd_problema

--ex3
SELECT
P.nm_problema, L.nr_telefone
FROM T_A09_LIGACAO L 
JOIN T_A09_PROBLEMA P ON L.cd_Problema = P.cd_problema


--ex4
SELECT
P.nm_problema, L.cd_ligacao
FROM T_A09_PROBLEMA P LEFT JOIN T_A09_LIGACAO L
ON L.cd_Problema = P.cd_problema
where L.cd_ligacao is null


--ex5
SELECT
P.nm_problema, COUNT(L.cd_ligacao)
FROM T_A09_LIGACAO L 
JOIN T_A09_PROBLEMA P ON L.cd_Problema = P.cd_problema
GROUP BY P.nm_problema

--EX6
SELECT
P.nm_problema, ROUND(AVG(L.vl_minutos),1)
FROM T_A09_LIGACAO L 
JOIN T_A09_PROBLEMA P ON L.cd_Problema = P.cd_problema
GROUP BY P.nm_problema

--EX7
SELECT
P.nm_problema, SUM(L.vl_minutos)
FROM T_A09_LIGACAO L 
JOIN T_A09_PROBLEMA P ON L.cd_Problema = P.cd_problema
GROUP BY P.nm_problema
ORDER BY SUM(L.vl_minutos) DESC

--ex8
SELECT dt_ligacao, COUNT(cd_ligacao)
FROM T_A09_LIGACAO
GROUP BY dt_ligacao

--ex9
SELECT
L.dt_ligacao, A.nm_atendente, ROUND(SUM(L.vl_minutos)/60,2)
FROM T_A09_ATENDENTE A
JOIN T_A09_LIGACAO L ON A.cd_atendente = L.cd_atendente
JOIN T_A09_PROBLEMA P ON L.cd_Problema = P.cd_problema
GROUP BY L.dt_ligacao, A.nm_atendente

--EX10 VERSAO 1
SELECT dt_ligacao, SUM(vl_minutos)
FROM T_A09_LIGACAO
GROUP BY dt_ligacao

--ex10 versao 2
SELECT
A.NM_ATENDENTE, L.DT_LIGACAO, SUM(L.vl_minutos)
FROM T_A09_ATENDENTE A
JOIN T_A09_LIGACAO L ON A.cd_atendente = L.cd_atendente
JOIN T_A09_PROBLEMA P ON L.cd_Problema = P.cd_problema
GROUP BY A.NM_ATENDENTE, L.DT_LIGACAO
order by SUM(L.vl_minutos)

--EX11
select dt_ligacao, count(cd_ligacao) 
FROM T_A09_LIGACAO
WHERE cd_atendente is null
GROUP BY dt_ligacao

--EX12
SELECT
A.nm_atendente, TRUNC(AVG(L.vl_minutos),0)
FROM T_A09_ATENDENTE A
JOIN T_A09_LIGACAO L ON A.cd_atendente = L.cd_atendente
GROUP BY A.nm_atendente 

--EX13
SELECT
P.NM_PROBLEMA, A.NM_ATENDENTE, SUM(vl_minutos)
FROM T_A09_ATENDENTE A
JOIN T_A09_LIGACAO L ON A.cd_atendente = L.cd_atendente
JOIN T_A09_PROBLEMA P ON L.cd_Problema = P.cd_problema
GROUP BY P.NM_PROBLEMA, A.NM_ATENDENTE

--EX14
SELECT
A.NM_ATENDENTE, 
ROUND(SUM(L.VL_MINUTOS)/60,1) AS "Horas Trabalhadas",
ROUND(SUM(L.VL_MINUTOS)/60,1)*4.88 as "Total R$",
ROUND(SUM(L.VL_MINUTOS)/60*4.88,1) as "Valor a Pagar"
FROM T_A09_ATENDENTE A
JOIN T_A09_LIGACAO L ON A.cd_atendente = L.cd_atendente
GROUP BY A.NM_ATENDENTE

--ex15
SELECT AVG(vl_minutos) FROM T_A09_LIGACAO
WHERE cd_atendente IS NULL;

--ex16
SELECT
L.nr_telefone, p.nm_problema
FROM T_A09_LIGACAO L 
JOIN T_A09_PROBLEMA P ON L.cd_Problema = P.cd_problema
WHERE LOWER(P.NM_PROBLEMA) LIKE '%internet%'








