SELECT S.nm_suspeito, SUM(E.vl_minutos)
FROM T_EX_SUSPEITO S JOIN T_EX_ESCUTA E
ON S.cd_suspeito = E.cd_suspeito
GROUP BY S.nm_suspeito

SELECT dt_escuta, AVG(vl_minutos)
FROM T_EX_ESCUTA
GROUP BY dt_escuta;

SELECT S.nm_suspeito, C.nm_crime
FROM T_EX_SUSPEITO S 
JOIN T_EX_ACUSACAO A ON S.cd_suspeito = A.cd_suspeito
JOIN T_EX_CRIME C ON C.cd_crime = A.cd_crime

SELECT C.nm_crime, COUNT(A.cd_crime)
FROM T_EX_CRIME C 
JOIN T_EX_ACUSACAO A ON A.cd_crime = C.cd_crime
GROUP BY C.nm_crime;

SELECT C.nm_crime
FROM T_EX_CRIME C 
LEFT JOIN T_EX_ACUSACAO A ON A.cd_crime = C.cd_crime
WHERE A.cd_crime IS NULL;





