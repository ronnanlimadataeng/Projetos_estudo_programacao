----------------------------------------------------- https://sqlbolt.com/lesson/select_queries_introduction -----------------------------------------------------
-----------------------------------------------------> Exercício 1 — Tarefas --  SQL Lesson 1: SELECT queries 101 

-- Encontre o title de cada filme
select title from movies

-- Encontre o director de cada filme
select director from movies

-- Encontre o titlee director de cada filme
select title, director from movies

-- Encontre o titlee year de cada filme
select title, year from movies

-- Encontre allas informações sobre cada filme
select * from movies



----------------------------------------------------- https://sqlbolt.com/lesson/select_queries_with_constraints -----------------------------------------------------
-----------------------------------------------------> Exercício 2 — Tarefas --  SQL Lesson 2: Queries with constraints (Pt. 1) 

-- Encontre o filme com uma linha id de 6
select title from movies where id = 6

-- Encontre os filmes lançados nos year anos de 2000 a 2010
select title from movies where year >= 2000 and year <= 2010
select title from movies where year between 2000 and 2010

-- Encontre os filmes não lançados nos year anos entre 2000 e 2010
select title from movies where year not between 2000 and 2010
select title from movies where year not in (select year from movies where year between 2000 and 2010)
select Title from movies m where not EXISTS (select 1 from movies m2  where m2.Year >= 2000 and m2.Year <= 2010 and m2.Id = m.Id)

-- Encontre os 5 primeiros filmes da Pixar e seus lançamentos year
select title, year from movies limit 5


----------------------------------------------------- https://sqlbolt.com/lesson/select_queries_with_constraints_pt_2 -----------------------------------------------------
-----------------------------------------------------> Exercício 3 — Tarefas --  SQL Lesson 3: Queries with constraints (Pt. 2)
-- Encontre todos os filmes Toy Story
select * from movies where title like '%Toy Story%'

-- Encontre todos os filmes dirigidos por John Lasseter
select * from movies where director like '%John Lasseter%'
select * from movies where director = 'John Lasseter'

-- Encontre todos os filmes (e diretores) não dirigidos por John Lasseter
select * from movies where director != 'John Lasseter'

-- Encontre todos os filmes WALL-*
select * from movies where title like '%WALL-%'


----------------------------------------------------- https://sqlbolt.com/lesson/filtering_sorting_query_results -----------------------------------------------------
-----------------------------------------------------> Exercício 4 — Tarefas --  SQL Lesson 4: Filtering and sorting Query results





