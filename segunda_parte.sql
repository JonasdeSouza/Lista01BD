// Criando as tabelas // 

create table Movies(
	movie_id serial primary key,
	movie_name varchar(50),
	release_year date
);

create table Actors(
	actor_id serial primary key, 
	actor_name varchar(50),
	gender varchar(15)
);

create table Characters(
	character_name varchar(50) primary key,
	actor_id serial,
	constraint fk_ActorsMovie foreign key (actor_id) references Actors (actor_id),
	movie_id serial,
	constraint fk_CharactersMovie foreign key (movie_id) references Movies (movie_id)
);

// Inserindo dados // 

INSERT INTO Movies
(movie_name, release_year)
Values
('Django Unchained', '2013-01-18'),
('Inception', '2010-08-06'),
('Pulp Fiction', '1995-02-18');
INSERT INTO Actors
(actor_name, gender)
Values
('Leonardo DiCaprio', 'Male'),
('Samuel L. Jackson', 'Male'),
('Uma Turman', 'Female');
INSERT INTO Characters
(character_name, actor_id, movie_id)
Values
('Calvin Candle', 1, 1),
('Cobb', 1, 2),
('Jules Winnfield', 2, 3);

INSERT INTO Movies
(movie_name, release_year)
Values
('Interestelar', '2014-11-06'),
('Cidade de Deus', '2002-08-30');
INSERT INTO Actors
(actor_name, gender)
Values
('Matthew McConaughey', 'Male'),
('Phellipe Haagensen', 'Male');
INSERT INTO Characters
(character_name, actor_id, movie_id)
Values
('Cooper', 4, 4),
('Bené', 5, 5);

// Listando os filmes // 

select movie_name from movies where release_year < ('2011-01-01');
select * from characters where character_name like 'C%';

// Atualizando os nomes//

update Actors set actor_name = 'Uma Thurman' where actor_name = 'Uma Turman';

// Adicionando campos //

alter table Actors add column birth_date date;
update Actors set birth_date = '1984-06-26' where actor_name = 'Phellipe Haagensen';

// Extra: Brincando com Join //

select actors.actor_name, characters.character_name from actors left join characters on actors.actor_id = characters.actor_id;


 
