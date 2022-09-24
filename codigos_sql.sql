----------------------------------------------- /* RELACIONAMENTOS UM PARA UM(ONE TO ONE) */ ----------------------------------------------- 

create database relacoes;
drop table estudantes;
drop table contato;
use relacoes;

create table estudantes(
	id int primary key auto_increment not null,
    nome VArCHAR(100),
    turma varchar(100));
    
create table contato (
	id int primary key auto_increment not null, 
    telefone varchar(100),
    endereço varchar(100) not null,
    estudante_id int not null, 
    foreign key(estudante_id) references estudantes(id));

select * from contato;

insert into estudantes (nome,turma) values ("Ana Carolina", "Turma A");
insert into estudantes (nome,turma) values ("Lara", "Turma b");
insert into estudantes (nome,turma)  values ("Camila", "Turma D");
insert into estudantes (nome,turma)  values ("Pedro", "Turma C");
insert into contato (telefone, endereço, estudante_id) values ("18-29394983","Rua Jose Alcides",1);
insert into contato(telefone, endereço,estudante_id) values ("16-2256641","Rua 1 de abril",2); 
insert into contato(telefone,endereço,estudante_id) values ("16-2957641","Rua Jose Augusto",3);
insert into contato(telefone,endereço,estudante_id) values ("16-123651","Rua Paes leme",4);

select * from estudantes;
select * from contato;
   
select  estudantes.nome, estudantes.turma, contato.telefone 
from estudantes 
join contato on contato.estudante_id = estudantes.id;


    

----------------------------------------------- /* FUNÇÕES DE NUMERO */ ----------------------------------------------- 

/* Arredondando para Cima */
select amount,ceil(amount) as arredondado 
from sakila.payment;

select count(*) as "Qtda total colunas" 
from sakila.payment;

/* qtda total de clientes cadastrados */
select count(first_name) 
from sakila.customer;

/* Arredondando para Baixo */
select amount, floor(amount) as para_cima
from sakila.payment;

/* Maior valor Retornado*/
select MAX(amount) as maior_valaor
from sakila.payment;

/* Menor valor Retornado*/
select min(amount) as menor_valor
from sakila.payment;

select MAX(amount) as maior_valor, min(amount) as menor_valor
from sakila.payment;

/* Exercicio */ 
select min(salary) as menor_valor, max(salary) as maior_valor
from employees.salaries;

/* Função Sum */
select sum(salary) 
from employees.salaries
where emp_no = 10001;

select sum(amount)
from sakila.payment;

select * from employees.salaries;


----------------------------------------------- /* GROUP BY*/ ----------------------------------------------- 

/* GROUP BY */
SELECT gender, COUNT(gender) AS "Qtd por gêneros"
FROM employees
GROUP BY gender;

/* Exercício 23 */
SELECT  hire_date, COUNT(hire_date) AS "Data contratação"
FROM employees
GROUP BY hire_date
ORDER BY COUNT(hire_date) DESC;



----------------------------------------------- /* /* CONSTRAINTS */*/ ----------------------------------------------- 

/* NOT NULL */
CREATE DATABASE constrains;
USE constrains;
CREATE TABLE pessoas (
   nome VARCHAR(100) NOT NULL, 
   idade INT
);
INSERT INTO pessoas (nome,idade) VALUES ("Mateus", 30);
SELECT * FROM pessoas;
INSERT INTO pessoas (nome) VALUES ("Carol");
CREATE TABLE pessoas2 (
   nome VARCHAR(100) NOT NULL, 
   idade INT NOT NULL
);
SELECT * FROM pessoas2;
INSERT INTO pessoas2 (nome,idade) VALUES ("",15);

/* UNIQUE*/
ALTER TABLE pessoas ADD COLUMN email VARCHAR(100) UNIQUE;
select * from pessoas;
INSERT INTO pessoas VALUES ("Maria",30, "marian@gmail.com"); /* email com valor unico*/ 

/* PRIMARY KEY */
CREATE TABLE produtos (
   id INT NOT NULL,
   nome VARCHAR (50),
   SKU VARCHAR (10),
   PRIMARY KEY(id,SKU)
   );
SELECT * FROM produtos;

INSERT INTO produtos VALUES (1, "fogao", "12sdd");
INSERT INTO produtos (id,nome, sku) VALUES (1,"batedeira", "15kkkk");
INSERT INTO produtos VALUES (3, "tvSamsung", "125dklki");

UPDATE produtos SET sku= "1agsd" WHERE id=2;

DELETE FROM produtos WHERE id = 0;

SELECT * FROM produtos;

/* AUTO INCREMENT */
CREATE TABLE frutas (
      id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
      nome VARCHAR (100));
      
USE constrains;
INSERT INTO frutas (nome) VALUES ("Mamao");
SELECT * FROM frutas;
INSERT INTO frutas (nome) VALUES ("morango");
INSERT INTO frutas (nome) VALUES ("Manga");
DELETE FROM frutas WHERE id=2;
INSERT INTO frutas (nome) VALUES ("Caqui");

/* FOREIGN KEY */
DROP TABLE pessoas;
CREATE TABLE pessoas (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR (100),
    idade INT);
    
CREATE TABLE endereço(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    rua VARCHAR(100),
    numero VARCHAR(10),
    pessoas_id  INT NOT NULL,
    foreign key (pessoas_id) REFERENCES pessoas(id));
SELECT * FROM endereço;
SELECT * FROM pessoas;
INSERT INTO pessoas(nome, idade) VALUES ("Maria", 30);
INSERT INTO endereço(rua,numero, pessoas_id) VALUES ("Jose bolifacio", "125", 1);
UPDATE pessoas SET idade=19 WHERE id=2;
UPDATE pessoas SET nome= "Joao" WHERE id=2;
INSERT INTO pessoas(nome,idade) VALUES ("Eduardo",35);
INSERT INTO pessoas (nome, idade) VALUES ("Gabriela", 42);
UPDATE pessoas SET nome = "Silva" WHERE id= 5;
SELECT * FROM pessoas;
SELECT * FROM endereço;
INSERT INTO endereço(rua, numero, pessoas_id) VALUES("EXEMPLO2","1",2);

/*  INDEX */
USE employees;
SELECT * FROM employees;

CREATE INDEX index_name
ON employees(first_name);

SELECT * FROM employees;

/* REMOVENDO INDEX */
DROP INDEX index_name ON employees;


----------------------------------------------- /* FUNÇÕES DE STRING*/ ----------------------------------------------- 

USE sakila;
SELECT * from actor;

--  CHAR_LENGTH ( retorna o numero de caracteres de cada linha de uma coluna
SELECT * FROM  country;
SELECT first_name, CHAR_LENGTH(first_name) AS "primeiro_nome", last_name, CHAR_LENGTH(last_name) AS "segundo_nome",
country.country, CHAR_LENGTH(country) AS Cidade
	FROM country, actor
WHERE CHAR_LENGTH(first_name) >10  
ORDER BY CHAR_LENGTH(country) DESC;

-- Exercício 26
SELECT * FROM address;
SELECT address_id, address, postal_code, CHAR_LENGTH(postal_code)
	FROM  address
ORDER BY address_id DESC;

-- 	CONCAT
SELECT * from empresa.funcionarios;

SELECT CONCAT(nome," tem ", idade," anos de idade! ") AS "nome_e_idade"
	from empresa.funcionarios;
    
-- Exercício 27
SELECT * FROM sakila.actor;
SELECT CONCAT(" nome ", first_name, " sobrenome ", last_name) AS "nome_e_sobrenome"
	from sakila.actor;
    
SELECT actor_id, CONCAT( first_name ," ", last_name ) AS "nome_e_sobrenome"
	FROM  sakila.actor;
    
-- CONCATE_WS (separador comunm)
SELECT * FROM empresa.funcionarios;
SELECT CONCAT_WS(" , ", id, nome,idade) from empresa.funcionarios; 

-- FORMAT
SELECT * from sakila.payment;
SELECT payment_id, amount, FORMAT(amount,1) 
	FROM sakila.payment;
    
-- INSTR  conta no numero de posição de algum caracter
SELECT * FROM sakila.customer;
USE sakila;

SELECT email, INSTR(email,"@") FROM customer;

SELECT email, INSTR(email,"org") 
	FROM customer
WHERE INSTR(email,"org") > 20;

-- LCASE (Minúsculo)
SELECT * FROM actor;
SELECT first_name, last_name, LCASE(CONCAT(first_name, " ", last_name)) AS "nome_completo"
	FROM actor;
    
-- UCASE (Maiúsculo)
SELECT UCASE(description) FROM sakila.film;    

-- LEFT 
SELECT * from film;
SELECT title, LEFT(title,8) FROM film 
WHERE film_id= 1;

-- RIGHT EXTRAI CARACTERES DA DIREITA PRA ESQUERDA
SELECT RIGHT(last_update,8) AS Horário FROM sakila.category;

-- REPLACE (Adiciona um texto, ou , atualiza o texto proposto)
SELECT REPLACE(name,"Action","Action & Adventure") AS name
	FROM category;
    
-- EXERCICIO 
SELECT 
	REPLACE(first_name, "MARY","Maria") AS Nome,
    REPLACE(last_name,"SMITH", "Smith") AS Sobrenome
    FROM customer
WHERE last_name = "SMITH";
   
-- SUBSTR (TIRAR UMA STRING EM UM INTERVALO)
SELECT last_update, SUBSTR(last_update,1,4) AS Ano,
	SUBSTR(last_update, 6,2) AS Mês,
    SUBSTR(last_update,9,2) AS Dia FROM sakila.actor;

SELECT * FROM sakila.actor;



----------------------------------------------- /* FUNÇÕES DE DATA*/ ----------------------------------------------- 

USE sakila;

select * from actor;

/* adddate adiciona ou remove uma quantidade de horas, dias, meses, anos de uma data */
select last_update, adddate(last_update, "5 days") as cinco_dias,
adddate(last_update, interval 2 month) as dois_meses,
adddate(last_update, interval 2 year) as dois_anos from actor;

/* datediff calcular a fdiferença entre duas datas */
select datediff(adddate(last_update, interval 4 month),last_update) from actor;
select datediff(adddate(last_update, interval -2 year),last_update) from actor;

/* ADDTIME adiciona ou remove um tempo a uma data */
select *, addtime(last_update, "5 04:00:00") from actor
where first_name like "A%";

select *, addtime(last_update, "100 02:00:55") from actor
where actor_id > 50;

/* DATEFORMAT formta uma data com um padrão informado */
select *, date_format(last_update, "%Y") as ano,
 date_format(last_update, "%d/%m/%Y") as data_formatada from actor;
 
 /* DAY Retorna  dia de uma data */
 select *, day(last_update), day(addtime(last_update, "5 08:00:00"))
 from actor
 where actor_id > 100;
 
 /*  DAYOFWEEK Retorna o dia da semana em numero */
 select *, dayofweek(last_update) as dia_Semana,
 dayofweek(adddate(last_update, "3 days")) as adicionado3dias from actor;
 
 /* DAYOFYEAR  Retorna o dia do ano */
 select *, dayofyear(last_update) as dia_doano,
 dayofyear(adddate(last_update, "113 days")) as adicionado_dias,
 dayofweek(adddate(last_update, "113 days")) as dia_semana from actor;
 
 /* WEEKOFYEAR  Retorna a semana do ano de uma data */
 select *, weekofyear(last_update) from actor;
 
 select *,weekofyear(last_update) as semana, 
 weekofyear(adddate(last_update, interval 5 month))  as semana from actor;
 
 /* MONTH Retorna o mês do ano */
 select *, month(last_update),
 month(adddate(last_update, interval 9 month))
 from actor;

/* YEAR Retorna o Ano */
select *, YEAR(last_update), 
YEAR(adddate(last_update, interval 20 year))
from actor


----------------------------------------------- /* TIPOS DE SUBQUERYS*/ ----------------------------------------------- 

-- SUBQUERY 
SELECT emp_no,employees.first_name,(
	SELECT SUM(salary)
	FROM salaries
	WHERE employees.emp_no = salaries.emp_no
) AS "soma_salario"
FROM employees
ORDER BY emp_no DESC;

-- EXISTS 
SELECT  emp_no, first_name,last_name,(
	SELECT SUM(salary)
    from salaries 
    WHERE employees.emp_no = salaries.emp_no
) AS "soma_salario"
FROM employees
WHERE EXISTS(
	SELECT salary 
    FROM salaries 
    WHERE employees.emp_no = salaries.emp_no 
    HAVING SUM(salary) > 1800000
);

-- ANY 
SELECT first_name 
from employees
WHERE emp_no = ANY (
	SELECT emp_no
    FROM salaries
    WHERE salary > 150000
);

----------------------------------------------- /* CRUDS SQL */ ----------------------------------------------- 

Use empresa;
CREATE TABLE pessoas(nome VARCHAR(100), cpf CHAR(11), descricao MEDIUMTEXT);
CREATE database emoção;
drop DATABASE emoção;
CREATE TABLE cores(nome VARCHAR(2));
DROP TABLE cores;

CREATE DATABASE teste_tipos_dados;
USE teste_tipos_dados;
CREATE TABLE produtos(nome VARCHAR(50), sku CHAR(5), informacoes MEDIUMTEXT);
CREATE TABLE  cadastro(nome VARCHAR(100), sobrenome VARCHAR(100));
select * from teste_tipos_dados.cadastro;
USE teste_tipos_dados;

INSERT INTO produtos(nome,sku, informacoes) VALUES("Playstation 5", "PS5XY","É um videogame de ultima geração");
select * from produtos;
USE teste_tipos_dados;
INSERT INTO produtos(nome,sku, informacoes) VALUE("Celular", "CELSA", "Celular samsung s20");
INSERT INTO produtos(nome,sku, informacoes) VALUE("Sofá","MOVEI","Sófa muito fofo");
select * from produtos;

CREATE TABLE servidores (nome VARCHAR(100), espaco_disco INT(10), ligado BOOL);
INSERT INTO servidores(nome, espaco_disco,ligado) VALUE ("Servidor", 12365454, 0);
select * from servidores;
INSERT INTO servidores(nome, espaco_disco,ligado) VALUE ("Servidor 2", 11112,1);
INSERT INTO servidores(nome, espaco_disco, ligado) VALUE ("Servidor 3", 12541,0);
INSERT INTO servidores (nome, espaco_disco, ligado) VALUE ("Servidor 4", 1452,1);
SELECT * FROM servidores;

CREATE TABLE aniversario(nome VARCHAR(100), data_nascimento DATE);
INSERT INTO aniversario (nome, data_nascimento) VALUE ("Ana", "1995-09-26");
SELECT * FROM  aniversario;
INSERT INTO aniversario(nome,data_nascimento) VALUE ("Joao", "1995-10-30");

CREATE TABLE funcionarios(nome VARCHAR(100));
ALTER TABLE funcionarios ADD COLUMN (aniversario DATE);
SELECT * FROM funcionarios;
ALTER TABLE funcionarios ADD COLUMN (sobrenome VARCHAR(100));
INSERT INTO funcionarios (nome, aniversario, sobrenome) VALUES ("ANA", "1998-03-02", "Cassia");
ALTER TABLE funcionarios ADD COLUMN (cpf CHAR(11));
ALTER TABLE funcionarios DROP COLUMN aniversario;
ALTER TABLE funcionarios DROP COLUMN CPF;
ALTER TABLE funcionarios ADD COLUMN (Data_nascimento VARCHAR (100));
SELECT * FROM funcionarios;
ALTER TABLE funcionarios MODIFY COLUMN Data_nascimento date;
DELETE FROM pessoas WHERE nome = "joaquim";


----------------------------------------------- /* RELACIONAMENTO UM PARA MUITOS(ONE TO MANY) */ ----------------------------------------------- 

create table  cliente(
	id int primary key auto_increment not null,
    nome varchar(100),
    data_nascimento date
    );
 drop table pedidos;   
 drop table cliente;
create table pedidos(
	id int primary key auto_increment not null, 
    qtda_itens int(10),
    total float,
    cliente_id int not null, 
    foreign key (cliente_id) references cliente(id)
    );
    
insert into cliente(nome, data_nascimento) values ("Ana Carolina","1995-09-26");
insert into cliente(nome, data_nascimento) values ("Isabela","1995-03-10");
insert into cliente(nome, data_nascimento) values ("Pedro Henrique","1995-05-08");
insert into pedidos(qtda_itens, total ,cliente_id ) values (2,2500,1);
insert into pedidos(qtda_itens, total ,cliente_id ) values (3,500,1);
insert into pedidos(qtda_itens,total,cliente_id ) values (5, 5500,2);
insert into pedidos(qtda_itens, total ,cliente_id ) values (1,3300,2);
insert into pedidos(qtda_itens,total,cliente_id ) values (1, 300,3);
insert into pedidos(qtda_itens,total,cliente_id ) values (3, 1100,3);

/* junção de pedidos e clientes*/
select * from cliente;
select cliente.nome, cliente.data_nascimento, pedidos.qtda_itens,
pedidos.total, pedidos.cliente_id 
from cliente ;

/* pedidos Isabela */
select cliente.nome, cliente.data_nascimento, pedidos.qtda_itens,
pedidos.total, pedidos.cliente_id 
from cliente 
join pedidos ON pedidos.cliente_id = cliente.id
where cliente.id = 2;

----------------------------------------------- /* RELACIONAMENTO MUITOS PARA MUITOS(MANY TO MANY) */ ----------------------------------------------- 

create table materias(
	id int primary key auto_increment not null, 
    nome_materia varchar(100));
   
select * from materias;
create table estudantes_materias(
	estudante_id int not null, 
    materia_id int not null, 
    foreign key (estudante_id) references estudantes(id),
    foreign key (materia_id) references materias(id)
    );
    
insert into materias(nome_materia) values("Matemática");
insert into materias(nome_materia) values("Física");
insert into materias(nome_materia) values("Geografia");
insert into materias(nome_materia) values("Inglês");

select * from estudantes;
insert into estudantes_materias (estudante_id, materia_id) Values (1,4);
insert into estudantes_materias (estudante_id, materia_id) Values (1,1);
insert into estudantes_materias (estudante_id, materia_id) Values (2,3);
insert into estudantes_materias (estudante_id, materia_id) Values (3,4);
insert into estudantes_materias (estudante_id, materia_id) Values (3,1);
insert into estudantes_materias (estudante_id, materia_id) Values (4,2);
insert into estudantes_materias (estudante_id, materia_id) Values (4,1);

select * from estudantes_materias;

select * from estudantes
join estudantes_materias on estudante_id = estudantes.id;

select * from estudantes_materias
join materias on id = estudantes_materias.materia_id
join estudantes on estudante_id = estudantes.id;




----------------------------------------------- /* TIPOS DE UNION */ ----------------------------------------------- 

/* UNION */
USE employees;
SELECT dept_no FROM departments
UNION SELECT dept_no FROM dept_emp;

INSERT INTO departments(dept_no, dept_name) VALUES ("d010", "Analista") ;
SELECT * FROM departments;

SELECT dept_no FROM departments
UNION SELECT dept_no FROM dept_emp;

/* UNION ALL */
SELECT dept_no AS departamentos FROM departments
UNION ALL SELECT dept_no FROM dept_emp;
 
----------------------------------------------- /* OPERADORES */ ----------------------------------------------- 

USE employees;
SELECT * FROM salaries WHERE salary >= 150000;
SELECT * FROM titles WHERE emp_no >= 11500;

/* utilizando DISTINCT seleção unica */
SELECT DISTINCT title FROM titles;
SELECT DISTINCT dept_no FROM dept_emp;

/* Operadores lógicos WHERE, AND, OR, NOT */
SELECT 
  *
FROM 
  salaries 
WHERE 
  salary > 150000 
AND from_date > "1991-12-12" OR emp_no > 35000;

SELECT
  *
FROM 
  salaries 
WHERE
  salary > 153000 AND from_date > "1991-12-12" AND emp_no > 35000;

SELECT 
  * 
FROM
  titles
WHERE 
  title= "Senior Engineer" OR title = "Staff" OR emp_no = 12500 ORDER BY emp_no DESC;

USE employees;
SELECT * FROM titles WHERE NOT title= "Staff" AND NOT title= "Senior Engineer";
SELECT * FROM departments WHERE NOT dept_name= "Sales" AND NOT dept_name= "Finance";
SELECT * FROM salaries WHERE NOT salary > 60000 AND NOT salary <= 50000;

/* ORDER BY, LIMIT */
USE employees;
SELECT * FROM salaries ORDER BY salary DESC;
SELECT * FROM salaries ORDER BY from_date ASC;
SELECT * FROM titles ORDER BY title DESC;
SELECT * FROM employees ORDER BY birth_date DESC LIMIT 15;
SELECT * FROM  titles ORDER BY title ASC LIMIT 5;
SELECT * FROM titles 

/* MIN, MAX */
SELECT MIN(salary) from salaries;
SELECT MAX(salary) from salaries;
SELECT MAX(salary) AS salary from salaries;
SELECT MAX(salary) AS maximo from salaries;

/* COUNT */
SELECT COUNT(*) FROM salaries WHERE  salary > 100000;
SELECT COUNT(*) FROM employees WHERE gender = "F";
SELECT COUNT(*) FROM employess WHERE gender = "M";
SELECT COUNT(*) AS Registros FROM departments;
/* AVG */
SELECT AVG(salary) AS  mediaSalary FROM salaries WHERE salary > 100000; 
SELECT AVG(salary) from salaries;
/* SUM */ 
SELECT SUM(salary) from salaries;
SELECT SUM(salary) AS somatoria from salaries WHERE salary >= 100000;

/* LIKE */
SELECT * FROM employees WHERE first_name LIKE "%ana%" ORDER BY first_name ASC LIMIT 10;
SELECT * FROM employees WHERE last_name LIKE "%dou%";
SELECT * FROM employees WHERE first_name LIKE "%lo%" ORDER BY first_name ASC;
SELECT * FROM employees WHERE last_name LIKE "A%" AND gender LIKE "M";
SELECT * FROM employees WHERE last_name LIKE "%M" AND gender LIKE "F";
SELECT * FROM  employees WHERE last_name LIKE "K%" OR last_name LIKE "A%" LIMIT 10;
SELECT * FROM titles WHERE title LIKE "%Engineer%";

/* IN */
SELECT * FROM dept_emp WHERE dept_no IN ("d005", "d006", "d004") LIMIT 10;
select * from departments WHERE  dept_name IN ("PRODUCTION", "sales");
SELECT * FROM employees WHERE last_name IN ("Facello", "Peac");

/* BETWEEN */
SELECT * FROM dept_emp WHERE dept_no BETWEEN "d003" AND "d005";
SELECT 
  *
FROM
  salaries
WHERE
  salary BETWEEN 150000 AND 275000; 
  
SELECT SUM(salary) AS SomaSalario FROM salaries;
SELECT dept_no AS "Numero do Apartamento" , dept_name AS department_name FROM departments




----------------------------------------------- /* NOT NULL */ ----------------------------------------------- 

CREATE DATABASE constrains;
USE constrains;
CREATE TABLE pessoas (
   nome VARCHAR(100) NOT NULL, 
   idade INT
);
INSERT INTO pessoas (nome,idade) VALUES ("Mateus", 30);
SELECT * FROM pessoas;
INSERT INTO pessoas (nome) VALUES ("Carol");
CREATE TABLE pessoas2 (
   nome VARCHAR(100) NOT NULL, 
   idade INT NOT NULL
);
SELECT * FROM pessoas2;
INSERT INTO pessoas2 (nome,idade) VALUES ("",15);



----------------------------------------------- /* TIPOS DE JOINS */  ----------------------------------------------- 
/* INNER JOIN */

SELECT employees.first_name, employees.last_name, salaries.salary AS Salario
FROM employees
INNER JOIN salaries 
ON employees.emp_no = salaries.emp_no
WHERE salaries.salary >= 15000
ORDER BY salaries.salary DESC;

/* EXERCICIO 22 */
SELECT employees.first_name, employees.gender, titles.title
FROM employees
INNER JOIN titles 
ON employees.emp_no = titles.emp_no;

/* LEFT JOIN */
SELECT employees.*, salaries.salary AS Salario
FROM employees
LEFT JOIN  salaries 
ON employees.emp_no = salaries.emp_no
WHERE salaries.salary >= 15000;

/* RIGHT JOIN */ 
USE constrains;
SELECT endereço.rua, pessoas.*
FROM endereço
RIGHT JOIN pessoas
ON pessoas.id = endereço.pessoa_id;

/* Desafio */
USE employees;
SELECT employees.first_name, employees.last_name, titles.title, salaries.salary, dept_manager.dept_no
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no
INNER JOIN titles
ON  employees.emp_no = titles.emp_no
INNER JOIN dept_manager
ON employees.emp_no= dept_manager.emp_no
WHERE salaries.salary >= 15000 AND NOT titles.title = "Manager"
ORDER BY salaries.salary DESC;
