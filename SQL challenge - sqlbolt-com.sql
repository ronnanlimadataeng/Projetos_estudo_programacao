----------------------------------------------------- https://sqlbolt.com/lesson/select_queries_introduction -----------------------------------------------------
-----------------------------------------------------> Exercício 1 — Tarefas --  SQL Lesson 1: SELECT queries 101 

-- Encontre o title de cada filme / Find the title of each film
select title from movies

-- Encontre o director de cada filme / Find the director of each film
select director from movies

-- Encontre o titlee director de cada filme / Find the title and director of each film
select title, director from movies

-- Encontre o titlee year de cada filme / Find the title and year of each film
select title, year from movies

-- Encontre allas informações sobre cada filme / Find all the information about each film
select * from movies







----------------------------------------------------- https://sqlbolt.com/lesson/select_queries_with_constraints -----------------------------------------------------
-----------------------------------------------------> Exercício 2 — Tarefas --  SQL Lesson 2: Queries with constraints (Pt. 1) 

-- Encontre o filme com uma linha id de 6 / Find the movie with a row id of 6
select title from movies where id = 6

-- Encontre os filmes lançados nos year anos de 2000 a 2010 / Find the movies released in the years between 2000 and 2010
select title from movies where year >= 2000 and year <= 2010
select title from movies where year between 2000 and 2010

-- Encontre os filmes não lançados nos year anos entre 2000 e 2010 / Find the movies not released in the years between 2000 and 2010
select title from movies where year not between 2000 and 2010
select title from movies where year not in (select year from movies where year between 2000 and 2010)
select Title from movies m where not EXISTS (select 1 from movies m2  where m2.Year >= 2000 and m2.Year <= 2010 and m2.Id = m.Id)

-- Encontre os 5 primeiros filmes da Pixar e seus lançamentos year / Find the first 5 Pixar movies and their release year
select title, year from movies limit 5








----------------------------------------------------- https://sqlbolt.com/lesson/select_queries_with_constraints_pt_2 -----------------------------------------------------
-----------------------------------------------------> Exercício 3 — Tarefas --  SQL Lesson 3: Queries with constraints (Pt. 2)

-- Encontre todos os filmes Toy Story / Find all the Toy Story movies
select * from movies where title like '%Toy Story%'

-- Encontre todos os filmes dirigidos por John Lasseter / Find all the movies directed by John Lasseter
select * from movies where director like '%John Lasseter%'
select * from movies where director = 'John Lasseter'

-- Encontre todos os filmes (e diretores) não dirigidos por John Lasseter / Find all the movies (and director) not directed by John Lasseter
select * from movies where director != 'John Lasseter'

-- Encontre todos os filmes WALL-* / Find all the WALL-* movies
select * from movies where title like '%WALL-%'








----------------------------------------------------- https://sqlbolt.com/lesson/filtering_sorting_query_results -----------------------------------------------------
-----------------------------------------------------> Exercício 4 — Tarefas --  SQL Lesson 4: Filtering and sorting Query results

-- Liste todos os diretores de filmes da Pixar (em ordem alfabética), sem duplicatas / List all directors of Pixar movies (alphabetically), without duplicates
select distinct director from movies Order by director asc

-- Liste os últimos quatro filmes da Pixar lançados (ordenados do mais recente ao menos) / List the last four Pixar movies released (ordered from most recent to least)
select title from movies order by year desc limit 4

-- Liste os cinco primeiros filmes da Pixar em ordem alfabética / List the first five Pixar movies sorted alphabetically
select title from movies order by title asc limit 5

-- Liste os próximos cinco filmes da Pixar em ordem alfabética / List the next five Pixar movies sorted alphabetically
select title from movies where title not in (select title from movies order by title asc limit 5) order by title asc limit 5








----------------------------------------------------- https://sqlbolt.com/lesson/select_queries_review -----------------------------------------------------
-----------------------------------------------------> Exercício 5 — Tarefas --  SQL Review: Simple SELECT Queries

-- Liste todas as cidades canadenses e suas populações / List all the Canadian cities and their populations
select city, population from North_american_cities where country = 'Canada'

-- Ordene todas as cidades dos Estados Unidos por sua latitude de norte a sul / Order all the cities in the United States by their latitude from north to south
select city from North_american_cities where Country = 'United States' Order by latitude desc

-- Liste todas as cidades a oeste de Chicago, ordenadas de oeste para leste / List all the cities west of Chicago, ordered from west to east
select city from north_american_cities where longitude < -87.629798 order by longitude

-- Liste as duas maiores cidades do México (por população) / List the two largest cities in Mexico (by population)
select city from North_american_cities where country = "Mexico" Order by population desc limit 2
select city, population from North_american_cities where country = "Mexico" Order by population desc limit 2

-- Liste a terceira e quarta maiores cidades (por população) nos Estados Unidos e sua população / List the third and fourth largest cities (by population) in the United States and their population
select city from North_american_cities where country = "United States" and city not in (select city from North_american_cities where country = "United States" Order by population desc limit 2) Order by population desc limit 2
select city, population from North_american_cities where country = "United States" and city not in (select city from North_american_cities where country = "United States" Order by population desc limit 2) Order by population desc limit 2








----------------------------------------------------- https://sqlbolt.com/lesson/select_queries_with_joins -----------------------------------------------------
-----------------------------------------------------> Exercício 6 — Tarefas --  SQL Lesson 6: Multi-table queries with JOINs

-- Encontre as vendas nacionais e internacionais de cada filme /	Find the domestic and international sales for each movie
select mv.title, sls.domestic_sales, sls.international_sales 
from movies mv inner join boxoffice sls ON mv.id = sls.Movie_id 

-- Mostre os números de vendas de cada filme que teve melhor desempenho internacional em vez de doméstico /	Show the sales numbers for each movie that did better internationally rather than domestically
select mv.title, sls.domestic_sales, sls.international_sales
from movies mv 
inner join boxoffice sls ON mv.id = sls.Movie_id
where sls.international_sales > sls.domestic_sales


-- Liste todos os filmes por suas classificações em ordem decrescente /	List all the movies by their ratings in descending order
select mv.title, rating
from movies mv 
inner join boxoffice sls ON mv.id = sls.Movie_id
order by rating desc








----------------------------------------------------- https://sqlbolt.com/lesson/select_queries_with_outer_joins -----------------------------------------------------
-----------------------------------------------------> SQL Lesson 7: OUTER JOINs

-- Encontre a lista de todos os prédios que possuem funcionários / Find the list of all buildings that have employees 
select distinct building_name
from buildings bui
left join employees emp ON bui.building_name = emp.building
where role is not null

-- Encontre a lista de todos os edifícios e sua capacidade / Find the list of all buildings and their capacity
select distinct bui.building_name, capacity
from buildings bui
left join employees emp ON bui.building_name = emp.building

-- Liste todos os prédios e as funções distintas dos funcionários em cada prédio (incluindo prédios vazios) / List all buildings and the distinct employee roles in each building (including empty buildings) 
select distinct bui.building_name, role
from buildings bui
left join employees emp ON bui.building_name = emp.building








----------------------------------------------------- https://sqlbolt.com/lesson/select_queries_with_nulls -----------------------------------------------------
-----------------------------------------------------> SQL Lesson 8: A short note on NULLs 
-- Encontre o nome e a função de todos os funcionários que não foram atribuídos a um edifício / Find the name and role of all employees who have not been assigned to a building 
select distinct emp.name, emp.role
from employees emp
where building is null

-- Encontre os nomes dos prédios que não possuem funcionários / Find the names of the buildings that hold no employees 
select distinct bui.building_name
from buildings bui
left join employees emp ON bui.building_name = emp.building
where emp.building is null








----------------------------------------------------- https://sqlbolt.com/lesson/select_queries_with_expressions -----------------------------------------------------
-----------------------------------------------------> SQL Lesson 9: Queries with expressions 
-- Liste todos os filmes e suas vendas combinadas em milhões de dólares / List all movies and their combined sales in millions of dollars

-- Liste todos os filmes e suas classificações em porcentagem / List all movies and their ratings in percent

-- Liste todos os filmes que foram lançados em anos pares / List all movies that were released on even number years



