#Cometário!
/*Comentário*/
#########################
#19/09/2019
#Revisão Khan Academy
#########################

#Criando um banco de dados

CREATE DATABASE khanacademy ; #Ctrl Enter

# DDL - Definindo um banco de dados para USO
USE khanacademy ; # Ctrl Enter

# DDL - Apagando um banco de dados
DROP DATABASE test ; # Ctrl Enter

# Desafios: Os hobbies de Bobby
/*
Etapa 1
https://pt.khanacademy.org/computing/computer-programming/sql/relational-queries-in-sql/pc/challenge-bobbys-hobbies

Criamos um banco de dados de pessoas e hobbies, e cada linha em hobbies está relacionada a uma
 linha em persons por meio da coluna person_id. Nessa primeira etapa, insira mais uma linha em
 persons e então mais uma linha em hobbies que esteja relacionada à pessoa recentemente inserida. 
 */
 
 CREATE TABLE persons (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45),
    age INTEGER);
    
INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12),
 ("Lucy BoBucie", 25),
 ("Banana FoFanna", 1),
 ("Shish Kabob", 20),
 ("Fluffy Sparkles", 8);
 
 
 
# Apenas um Ctrl Enter por linha!

CREATE table hobbies (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    person_id INTEGER,
    name VARCHAR(45));
    
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

SELECT * FROM persons;
SELECT * FROM hobbies;

/*
Nessa primeira etapa, insira mais uma linha em persons e então mais
 uma linha em hobbies que esteja relacionada à pessoa recentemente inserida.
*/

INSERT INTO persons (name, age) VALUES ("Gabriel Silva",18);
INSERT INTO hobbies (person_id, name) VALUES (6, "skating");

/* Para apagar itens da tabela. Ex.:
DELETE FROM persons WHERE id = 7;
*/
DELETE FROM hobbies WHERE id >= 12;
/* Para fazer correções e modificações no INSERT. Ex.:
UPDATE persons SET name = "Tarcísio Nunes" WHERE id  = 6  
*/

/*
Agora, selecione 2 tabelas com um comando join para que você
 possa ver o nome de cada pessoa ao lado de seu hobby.
*/

SELECT persons.name, hobbies.name FROM persons inner JOIN hobbies
ON persons.id = hobbies.person_id;

/*
Agora, faça uma consulta adicional que mostre apenas o nome e os hobbies de "Bobby McBobbyFace", usando JOIN combinado com WHERE.
*/

SELECT * FROM persons;

SELECT persons.name, hobbies.name FROM persons inner JOIN hobbies
ON persons.id = hobbies.person_id
WHERE persons.name = "Bobby McBobbyFace";

/*
Refaça este exemplo utilizando uma tabela associativa!
Crie novas tabelas com nomes em portugues:
pessoa {id, nome, idade}
hobby{id, nome}

Uma terceira tabela associativa, para relacionar pessoas
aos hobbies.
Faça o insert dos dados nas 3 tabelas.
*/

CREATE TABLE pessoa
 (id INTEGER PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45), idade INTEGER);
 
 CREATE TABLE hobby
 (id INTEGER PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(45));
 
 INSERT INTO pessoa (id, nome, idade) VALUES
 (10, "Gabriel",18), (20, "Maria", 19),
 (17, "Ana", 32);
 
INSERT INTO hobby (id, nome) VALUES
(100, "Natação"), (200, "Assistir Netflix"),
(300, "Jogar LoL"), (400, "Morcegar"),
(500, "Ler livros");

/*
Sugestão:
Uma pessoa com dois hobbies e outra com três
*/

CREATE TABLE hobby_da_pessoa
(id_pessoa INTEGER,
id_hobby INTEGER);

INSERT INTO hobby_da_pessoa VALUES
(20,100), (20,300), (20,500), # Maria com 3 hobbies
(17,200), (17,400); # Ana com 2 hobbies

/*
Agora, selecione 3 tabelas co um comando join para que você 
possa ver o nome de cada pessoa ao lado de seu hobby.
*/

# Apenas pessoas com hobby
SELECT p.nome AS Nome, p.idade AS idade, h.nome AS Hobby
 FROM hobby_da_pessoa AS hp
 INNER JOIN pessoa p ON p.id = hp.id_pessoa
 INNER JOIN hobby h ON h.id = hp.id_hobby;
 
 #Mostrando todas as pessoas e seus hobbiespessoapessoa
 SELECT p.nome AS Nome, p.idade AS idade, h.nome AS Hobby
 FROM hobby_da_pessoa AS hp
 LEFT JOIN pessoa p ON p.id = hp.id_pessoa
 LEFT JOIN hobby h ON h.id = hp.id_hobby;