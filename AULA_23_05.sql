CREATE DATABASE STREAMING;

USE STREAMING;

-- Criar uma tabela movies com movie_id , movie title e genre
CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100)
);

-- Criar uma tabela chamada clients com client_id, name e email
CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Criar uma tabela com subscriptions com subscription_id,
-- client_id, movie_id e subscription_date
CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY,
    client_id INT,
    movie_id INT,
    subscription_date DATE NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

 INSERT INTO movies (movie_id, title, genre) VALUES 
(1, 'Inception', 'Sci-Fi'),
(2, 'The Godfather', 'Crime'),
(3, 'The Dark Knight', 'Action'),
(4, 'Pulp Fiction', 'Drama'),
(5, 'Forrest Gump', 'Drama');


 INSERT INTO clients (client_id, client_name, email) VALUES
(1, 'Alice', 'alice@gmail.com'),
(2, 'Bob', 'bob@gmail.com'),
(3, 'Charlie', 'test@gmail.com'),
(4, 'David', 'david@outlook.com'),
(5, 'Eve', 'eve@outlook.com');

 INSERT INTO subscriptions (subscription_id, client_id, movie_id, subscription_date) VALUES
(1, 1, 1, '2023-01-01'),
(2, 2, 2, '2023-01-01'),
(3, 3, 3, '2023-01-01'),
(4, 4, 4, '2023-04-01'),
(5, 5, 5, '2023-05-01')
;
-- inner join
SELECT
    subscriptions.subscription_id,
    clients.client_name,
    movies.title,
    subscriptions.subscription_date
FROM
    subscriptions
INNER JOIN
    clients ON subscriptions.client_id = clients.client_id
INNER JOIN
    movies ON subscriptions.movie_id = movies.movie_id;

    
    
    -- left join
    SELECT
    clients.client_name,
    subscriptions.subscription_id,
    movies.title,
    subscriptions.subscription_date
FROM
    clients
LEFT JOIN
    subscriptions ON clients.client_id = subscriptions.client_id
LEFT JOIN
    movies ON subscriptions.movie_id = movies.movie_id;
    
      -- right join
    SELECT
    movies.title,
    subscriptions.subscription_id,
    clients.client_name,
    subscriptions.subscription_date
FROM
    movies
RIGHT JOIN
    subscriptions ON movies.movie_id = subscriptions.movie_id
RIGHT JOIN
    clients ON subscriptions.client_id = clients.client_id;
    
    -- FULL OUTER JOIN

SELECT 
    clients.client_name,
    movies.title,
    subscriptions.subscription_id,
    subscriptions.subscription_date
FROM 
    clients
LEFT JOIN subscriptions ON clients.client_id = subscriptions.client_id
LEFT JOIN movies ON subscriptions.movie_id = movies.movie_id

UNION

SELECT 
    clients.client_name,
    movies.title,
    subscriptions.subscription_id,
    subscriptions.subscription_date
FROM 
    clients
RIGHT JOIN subscriptions ON clients.client_id = subscriptions.client_id
RIGHT JOIN movies ON subscriptions.movie_id = movies.movie_id;


-- CROSS JOIN

SELECT
    clients.client_name,
    movies.title
FROM
    clients
CROSS JOIN
    movies;
    
-- drop database STREAMING;
-- -- -- -- -- -- ---- -- -- -- -- -- ---- -- -- -- -- -- ---- -- -- -- -- -- ---- -- -- -- -- -- ---- -- -- -- -- -- ---- -- -- -- -- -- ---- -- -- -- -- -- -- -- -- -- --

-- CRIANDO DADOOS SOBRE INFORMAÇÃO SOBRE EVENTOS


CREATE DATABASE EVENTOS;

USE EVENTOS;
-- CRIANDO TABELAS SOBRE O EVENTO
CREATE TABLE events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE
);

CREATE TABLE participants (
    participant_id INT PRIMARY KEY,
    participant_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE registrations (
    registration_id INT PRIMARY KEY,
    participant_id INT,
    event_id INT,
    registration_date DATE,
    FOREIGN KEY (participant_id) REFERENCES participants(participant_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);


-- INSERINDO INFORMAÇÕES
INSERT INTO events (event_id, event_name, event_date) VALUES
(1, 'Tech Conference', '2023-11-01'),
(2, 'Music Festival', '2023-12-15'),
(3, 'Art Exhibition', '2023-10-20'),
(4, 'Food Fair', '2023-11-10');

INSERT INTO participants (participant_id, participant_name, email) VALUES
(1, 'Emma', 'emma@example.com'),
(2, 'Liam', 'liam@example.com'),
(3, 'Olivia', 'olivia@example.com'),
(4, 'Noah', 'noah@example.com');

INSERT INTO registrations (registration_id, participant_id, event_id, registration_date) VALUES
(1, 1, 1, '2023-10-01'),
(2, 2, 2, '2023-10-05'),
(3, 3, 3, '2023-09-20'),
(4, 4, 4, '2023-10-10'),
(5, 1, 2, '2023-10-15');

-- INNER JOIN PARA COOMBINAR AS TABELAS REGISTRATIONS, PARTICIPANTS E EVENTS.

SELECT
    registrations.registration_id,
    participants.participant_name,
    events.event_name,
    registrations.registration_date
FROM
    registrations
INNER JOIN
    participants ON registrations.participant_id = participants.participant_id
INNER JOIN
    events ON registrations.event_id = events.event_id;
    
-- LEFT JOOIN PARA COMBINAR TABELAS PARTICIPANTS, REGISTRATIONS E EVENTS.alter

SELECT
    participants.participant_name,
    registrations.registration_id,
    events.event_name,
    registrations.registration_date
FROM
    participants
LEFT JOIN
    registrations ON participants.participant_id = registrations.participant_id
LEFT JOIN
    events ON registrations.event_id = events.event_id;
    
    -- RIGHT JOIN PARA COMBINAR TABELAS EVENTS, REGISTRATION E PARTICIPANTS.
    
 SELECT
    events.event_name,
    registrations.registration_id,
    participants.participant_name,
    registrations.registration_date
FROM
    events
RIGHT JOIN
    registrations ON events.event_id = registrations.event_id
RIGHT JOIN
    participants ON registrations.participant_id = participants.participant_id;
    
    -- FULL OUTER JOIN PARA LISTAR TOODOS PARTICIPANTES E EVENTOS, INCLUINDO AQUELES QUE NÃO TEM INSCRIÇÕES.alter
    
 SELECT
    participants.participant_name,
    events.event_name,
    registrations.registration_id,
    registrations.registration_date
FROM
    participants
LEFT JOIN
    registrations ON participants.participant_id = registrations.participant_id
LEFT JOIN
    events ON registrations.event_id = events.event_id

UNION

SELECT
    participants.participant_name,
    events.event_name,
    registrations.registration_id,
    registrations.registration_date
FROM
    registrations
RIGHT JOIN
    participants ON participants.participant_id = registrations.participant_id
RIGHT JOIN
    events ON registrations.event_id = events.event_id;


-- CROSS JOIN LISTAR TODAS COMBINAÇÇÕES DE PARTICIPANTES POSSIVEIS.

SELECT
    participants.participant_name,
    events.event_name
FROM
    participants
CROSS JOIN
    events;

-- -- -- -- -- -- ---- -- -- -- -- -- ---- -- -- -- -- -- ---- -- -- -- -- -- ---- -- -- -- -- -- ---- -- -- -- -- -- ---- -- -- -- -- -- --

CREATE DATABASE EVENTOS_CULTURAIS;

USE EVENTOS_CULTURAIS;


-- CRIANDO TABELA DE PARTICIPANTES.
CREATE TABLE participantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE
);

-- INSERINDO DADOS DE PARTICIPANTES 
INSERT INTO participantes (nome, data_nascimento) VALUES
('Alice Ferreira', '2007-04-15'),
('Bruno Lima', '1998-08-21'),
('Carla Souza', '2010-11-30'),
('Daniel Monteiro', '2003-01-09');

-- CRIANDO FUNÇÃO DE MAIORIDADE
DELIMITER //

CREATE FUNCTION verifica_maioridade(data_nascimento DATE)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE idade INT;
    DECLARE resultado VARCHAR(20);

    SET idade = TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE());

    IF idade >= 18 THEN
        SET resultado = 'Maior de idade';
    ELSE
        SET resultado = 'Menor de idade';
    END IF;

    RETURN resultado;
END //

DELIMITER ;
SELECT verifica_maioridade('2000-01-01'); 

SELECT nome, data_nascimento, verifica_maioridade(data_nascimento) AS
status_maioridade FROM participantes;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

CREATE DATABASE GERENCIAMENTO_DE_USUARIO;

USE GERENCIAMENTO_DE_USUARIO;


-- CRIANDO TABELA DE USUARIOS;

CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


 --  CRIANDO TABELA DE AUDITORIA DOS USUARIOS;
 
CREATE TABLE auditoria_usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    campo_alterado VARCHAR(50) NOT NULL,
    valor_antigo VARCHAR(255),
    valor_novo VARCHAR(255),
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

-- INSERINDO USUARIOS;

INSERT INTO usuarios (nome, email, cargo) VALUES
('João Pereira', 'joao.pereira@email.com', 'Analista'),
('Maria Oliveira', 'maria.oliveira@email.com', 'Gerente'),
('Carlos Mendes', 'carlos.mendes@email.com', 'Técnico');

-- Crie triggers AFTER UPDATE que, ao detectar alterações em cada um dos campos
-- nome, email ou cargo da tabela usuarios, registrem as informações alteradas na
-- tabela auditoria_usuarios.


DELIMITER $$

CREATE TRIGGER trigger_auditoria_usuarios
AFTER UPDATE ON usuarios
FOR EACH ROW
BEGIN
	-- VERIFICA ALTERAÇÇÃO NO NOME
    IF OLD.nome <> NEW.nome THEN
        INSERT INTO auditoria_usuarios (id_usuario, campo_alterado, valor_antigo, valor_novo, data_alteracao)
        VALUES (OLD.id, 'nome', OLD.nome, NEW.nome, NOW());
    END IF;

		-- VERIFICA ALTERAÇÇÃO NO EMAIL
    IF OLD.email <> NEW.email THEN
        INSERT INTO auditoria_usuarios (id_usuario, campo_alterado, valor_antigo, valor_novo, data_alteracao)
        VALUES (OLD.id, 'email', OLD.email, NEW.email, NOW());
    END IF;


	-- VERIFICA ALTERAÇÃO NO CARGO
    IF OLD.cargo <> NEW.cargo THEN
        INSERT INTO auditoria_usuarios (id_usuario, campo_alterado, valor_antigo, valor_novo, data_alteracao)
        VALUES (OLD.id, 'cargo', OLD.cargo, NEW.cargo, NOW());
    END IF;
END $$

DELIMITER ;

UPDATE usuarios
SET nome = 'João Pedro Pereira', cargo = 'Supervisor'
WHERE id = 1;
SELECT * FROM auditoria_usuarios;






    






