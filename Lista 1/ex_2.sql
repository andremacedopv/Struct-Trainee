/* Lista 1 - Exercício 2 */

/* Item 2.1 */

/* Criar Tabelas */
CREATE TABLE if NOT EXISTS Movies(
    movie_id SERIAL,
    movie_name VARCHAR(50),
    release_year DATE,
    PRIMARY KEY (movie_id)
);

CREATE TABLE if NOT EXISTS Actors(
    actor_id SERIAL,
    actor_name VARCHAR(50),
    gender VARCHAR(45),
    PRIMARY KEY (actor_id)
);

CREATE TABLE if NOT EXISTS Characters(
    character_id SERIAL,
    character_name VARCHAR(50),
    actor_id INT,
    movie_id INT,
    PRIMARY KEY (character_id),
    FOREIGN KEY (actor_id)
        REFERENCES Actors (actor_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (movie_id)
        REFERENCES Movies (movie_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

/* Popular Tabelas */
INSERT INTO Movies
    (movie_name, release_year)
    Values
        ('Django Unchained', '2013-01-18'),
        ('Inception', '2010-08-06'),
        ('Pulp Fiction', '1995-02-18'),
        ('The Silence of the Lambs', '1991-02-14'),
        ('O Auto da Compadecida', '2000-09-15');

INSERT INTO Actors
    (actor_name, gender)
    Values
        ('Leonardo DiCaprio', 'Male'),
        ('Samuel L. Jackson', 'Male'),
        ('Uma Turman', 'Female'),
        ('Jodie Foster', 'Female'),
        ('Selton Mello', 'Male');

INSERT INTO Characters
    (character_name, actor_id, movie_id)
    Values
        ('Calvin Candle', 1, 1),
        ('Cobb', 1, 2),
        ('Jules Winnfield', 2, 3),
        ('Clarice Starling', 4, 4),
        ('Chicó', 5, 5);


/* Item 2.2 */

/* Listar Filmes antes de 2011*/
SELECT movie_name FROM Movies WHERE release_year<'2011-01-01';

/* Listar personagens que começam com C */
SELECT * FROM Characters WHERE character_name LIKE 'C%';


/* Item 2.3 */

/* Corrigir nome */
UPDATE Actors SET actor_name='Uma Thurman' WHERE actor_name='Uma Turman';


/* Item 2.4 */

/* Adicionar campo de data de nascimento */
ALTER TABLE Actors
    ADD birth_date DATE;

/* Adicionar data de nascimento em um dos atores */
UPDATE Actors SET birth_date='1972-12-30' WHERE actor_name='Selton Mello';


/* Item 2.5 */

/* Selecionar atores e os papeis que eles atuam */
SELECT Actors.actor_name, Characters.character_name
    FROM Actors
    LEFT JOIN Characters ON Characters.actor_id = Actors.actor_id;