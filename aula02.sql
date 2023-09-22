-- exibir o id do empregado, a data de admissao e o dia da semana que foi admitido (por exetenso e abreviado) de quem tem id entre 100 e 150
SELECT EMPLOYEE_ID, HIRE_DATE, TO_CHAR (HIRE_DATE,'DAY'), TO_CHAR(HIRE_DATE, 'DY') FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 100 AND 150

 

-- EXIBIR O NOME DO EMPREGADO E O SALARIO COM A MASCARA E MOEDA COREENTE DE QUEM TRABALHA NO DEPTO. COM ID MENOR QUE 50
SELECT first_name, TO_CHAR(salary,'L00,000.00') SALARIO FROM hr.employees
WHERE department_id < 50 ORDER BY salary

 

--EXERCICIO: alterar o zero para 9 e veja  o resultado

 

SELECT first_name, TO_CHAR(salary,'L99,999.99') SALARIO FROM hr.employees
WHERE department_id < 50 ORDER BY salary

 

SELECT EMPLOYEE_ID, HIRE_DATE, TO_CHAR(HIRE_DATE,'Month'), TO_CHAR(HIRE_DATE,'MON') FROM HR.EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 100 AND 150

 

SELECT employee_id, TO_CHAR(SYSDATE, 'HH24:MI:SS'), TO_CHAR(SYSDATE,'HH12:MI:SS') FROM hr.employees
WHERE department_id <=20

 

 

-- a) DECODE (comente no oracle) -- condicional 
SELECT employee_id, salary, job_id,
DECODE(job_id,'IT_PROG', salary * 1.10, 'ST_CLERK', salary * 1.05, salary ) Aumento
FROM hr.employees

 

-- b)  CASE (padrao ANSI)
SELECT employee_id, salary, job_id,
CASE job_id WHEN 'IT_PROG'  THEN salary * 1.10
            WHEN 'ST_CLERK' THEN salary * 1.05
ELSE salary END "Aumento"   FROM hr.employees

 

SELECT first_name, hire_date, TO_CHAR(HIRE_DATE+180, 'Day, dd month yyyy') as "Data contratação" FROM hr.employees

 

    
--funcoes de grupo
-- Exibir o maior e menor salario da empresA
SELECT MAX(salary), MIN(salary) FROM hr.employees
-- OBS essas funçoes trabalham com string e data.
SELECT MIN(hire_date), Max(hire_date) FROM hr.employees
SELECT MIN(first_name), Max(first_name) FROM hr.employees

 

-- Exibir media aritmetica salarial, soma salarial e a qtde de funcionario 

SELECT AVG(salary), SUM(salary), COUNT(*), COUNT(employee_id) FROM hr.employees
 

-- exibir contar a quantidade de departamente com funcionario, excluindo os valores
SELECT COUNT(department_id), COUNT(DISTINCT department_id) FROM hr.employees

-- exibir a quantidade de empregados por departamento
--a) forma errada
SELECT department_id, COUNT(employee_id) FROM hr.employees

 

--b) forma certa sem exibir o id do depto
SELECT COUNT (employee_id) FROM hr.employees GROUP BY department_id

 

--c) forma certa exibindo o id do depto
SELECT department_id, COUNT (employee_id) FROM hr.employees GROUP BY department_id ORDER BY department_id

-- podemos fazer grupo sobre grupo
-- agrupar a quantidade de epmregados e a soma salarial por cargo de cada depto.
SELECT department_id,job_id, COUNT(employee_id), SUM(salary) FROM hr.employees
GROUP BY  department_id, job_id ORDER BY 1

 

--b)having (clausula WHERE DO group by - funciona)
SELECT department_id, COUNT (employee_id) FROM hr.employees GROUP BY department_id
HAVING COUNT (employee_id) > 5

 

--Exibir o id do dpto,a soma salarial dos empregados dos deptos com id menores que 40, quando a soma salarial for maior ou igual a 15000,, ordenando pelo id do depto.
    SELECT department_id, SUM(salary) FROM hr.employees WHERE department_id < 50 
GROUP BY department_id HAVING SUM(salary) >= 15000 ORDER BY department_id

 

 

--Exibir os salaris totais de todos os cargos dos dptos com id menor que 60
SELECT department_id, SUM(salary) FROM hr.employees
WHERE department_id < 60
GROUP BY department_id, job_id

 

--A) rollup : subtotias 
SELECT department_id,job_id, SUM(salary) FROM hr.employees
WHERE department_id < 60
GROUP BY ROLLUP (department_id, job_id)

 

--b) cube: tabulaçao cruzada

 

SELECT department_id,job_id, SUM(salary) FROM hr.employees
WHERE department_id < 60
GROUP BY CUBE (department_id, job_id) 
ORDER BY 1, 2

