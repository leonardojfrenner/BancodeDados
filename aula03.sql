-- EXIBIR A QUANTIDADE DE REGISTROS :
-- a) REGIONS, b) COUNTRIES, C) LOCATIONS, D) departments, e) jobs (19), f) employes;
-- comando count exibi a quantidade de reguistros da tabela.

 

SELECT COUNT (job_id) FROM hr.jobs
    -- PADRAO ANSI -99 CROSS JOIN
SELECT department_name, first_name FROM hr.employees CROSS JOIN hr.departments

 

SELECT city, country_name FROM hr.locations, hr.countries

 

--EQUIJOIN : juncao identifica. une a chave primaria com a chave estrangeiira
--a) oracle
--a1 ) sem qaulificador ( escrever o nome da tabela )
	SELECT city, country_name FROM hr.locations, hr.countries
	WHERE countries.country_id = locations.country_id		

 

--a2 ) com qualificador (alias da catebla)
SELECT city, country_name FROM hr.locations l, hr.countries c
	WHERE c.country_id = l.country_id3

 

--b) ansi-99
--B. 2) ansi 99 (também é possivel usar alias ou nome de tabela)
--b		2.1) NATURAL JOIN ( o banco de dados busca as colunas de chave primaria e cchave estrangeira)
SELECT country_name, country_id, city FROM hr.locations NATURAL JOIN hr.countries

--b		2.2)ON (usado quando a condicao de juncao possui grafia diferente entre as colunas)
SELECT c.country_name, c.country_id, l.city
FROM hr.locations l JOIN hr.countries c 
ON (l.country_id = c.country_id)
--b 2. 3 ) USING (usado quando a condiçao de juncao possui mesma grafia; nao usamos apelido de tabela)
SELECT country_name, country_id, city
FROM hr.locations JOIN hr.countries
USING (country_id)

 

--QUANDO TEMOS MAIS DE DUAS TABELAS
SELECT country_name, country_id, city, department_name
FROM hr.countries JOIN hr.locations
USING (country_id)
JOIN hr.departments
USING (location_id)

--NO ORACLE 
SELECT country_name, city, department_name
FROM hr.countries c, hr.locations l, hr.departments d
WHERE c.country_id = l.country_id  
AND l.location_id = d.location_id 

--acrsecenta last name 
SELECT country_name, city, department_name, last_name
FROM hr.countries c, hr.locations l, hr.departments d, hr.employees e
WHERE c.country_id = l.country_id  
AND l.location_id = d.location_id
AND e.department_id = d.department_id


-- trazer o continente ( regions - regio_name ) 

SELECT country_name, city, department_name, last_name, region_name
FROM hr.countries c, hr.locations l, hr.departments d, hr.employees e, hr.regions r 
WHERE c.country_id = l.country_id  
AND l.location_id = d.location_id
AND e.department_id = d.department_id
AND c.region_id = r.region_id

-- EXIBIR INFORMAÇOES ENTRE TABELAS QUE NAO POSSUEM JOIN DIRETO
-- EXIBIR O NOME DO EMPREGADO E A CIDADE EM QUE ELE TRABALHA
SELECT e.first_name, l.city
FROM hr.employees e, hr.locations l, hr.departments d
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id

--COLOCANDO CONDIÇAO 
-- ALTERAR PARA EXIBIR SOMENTE QUANDO O NOME INICIAR COMM A LETRA a E ORDENAR PELO NOME DO EMPREGADO
SELECT e.first_name, l.city
FROM hr.employees e, hr.locations l, hr.departments d
WHERE e.department_id = d.department_id
	AND d.location_id = l.location_id
	AND e.first_name LIKE 'A%'
ORDER BY 1