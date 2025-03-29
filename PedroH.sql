-- CRIANDO O BANCO DE DADOS

CREATE DATABASE EMPRESA;
USE EMPRESA;

-- CRIANDO TABELA DE FUNCIONÁRIOS

CREATE TABLE FUNCIONARIOS (
	ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100)NOT NULL,
    DATA_NASCIMENTO DATE NOT NULL,
    SALARIO DECIMAL(10, 2)NOT NULL,
    DEPARTAMENTO_ID INT NOT NULL,
    CARGO_ID INT NOT NULL,
    FOREIGN KEY (DEPARTAMENTO_ID) REFERENCES DEPARTAMENTOS(ID),
    FOREIGN KEY (CARGO_ID) REFERENCES CARGOS(ID)
    );
    
    
    -- CRIANDO TABELAS DE DEPARTAMENTO
    
    CREATE TABLE DEPARTAMENTOS (
		ID INT PRIMARY KEY AUTO_INCREMENT,
        NOME VARCHAR(100) NOT NULL
        );
        
	-- CRIANDO TABELA DE CARGO
    
    CREATE TABLE CARGOS (
		ID INT PRIMARY KEY AUTO_INCREMENT,
        NOME VARCHAR(100) NOT NULL,
        NIVEL VARCHAR(50) NOT NULL
        );
        
-- INSERINDO DADOS NA TABELADEPARTAMENTOS

INSERT INTO DEPARTAMENTOS (NOME) VALUES ('TI'), ('RH'),
('FINANCEIRO'),('MARKETING'), ('VENDAS');

-- INSERINDODADOS NA TABELA CARGOS

INSERT INTO CARGOS (NOME, NIVEL) VALUES
('Analista','Pleno'),
('Gerente','Sênior'),
('Assistente', 'Júnior'),
('Cordenador','Sênior'),
('Desenvolvedor', 'Pleno');


-- INSERINDO DADOS NA TABELA FUNCIONARIOS


INSERT INTO FUNCIONARIOS (NOME, DATA_NASCIMENTO,
SALARIO, DEPARTAMENTO_ID, CARGO_ID) VALUES
('Ana Silva','1985-06-15', 5500.00, 1,5),
('Carlos Santos', '1990-03-22',4800.00, 2, 1),
('Bruna Costa', '1987-12-10', 6000.00, 3, 2),
('Daniel Oliveira', '1992-08-05', 5200.00, 1, 5),
('Fernanda Lima', '1995,09,30', 4500.00, 2, 3),
('Gustavo Souza', '1980-01-25', 7000.00, 3, 2),
('Helena Martins', '1983-11-17', 5300.00, 1, 4),
('Igor Ferreira', '1991-07-08', 4900.00, 2, 1),
('Juliana Rocha', '1989-04-19', 5600.00, 3, 2),
('Lucas Mendes','1993-06-23', 5100.00, 1, 5);        


   -- drop database empresa
        
        
        
        
        -- 1. Encontre o maior salário;
         SELECT MAX(SALARIO) AS Maior_Salario
         FROM FUNCIONARIOS;
         
         
         -- 2. Encontrar o menor salário;
         SELECT MIN(SALARIO) AS MenorSalario
         FROM FUNCIONARIOS;
         
         
         -- 3. Qual a quantidade de funcionários?
         SELECT * FROM FUNCIONARIOS;
         
         -- 4.Filtre os funcionários nascidos a partir de 1990.
        SELECT NOME,YEAR(DATA_NASCIMENTO) AS ANO
        FROM FUNCIONARIOS
        WHERE YEAR(DATA_NASCIMENTO) >= '1990';
		
         
         -- 5. Encontre a média salarial.
			SELECT AVG(SALARIO) AS MediaSalarial
            FROM FUNCIONARIOS;
		
         
         -- 6. Extraia os 3 primeiros caracteres do nome (substring)
         
         SELECT SUBSTRING(NOME, 1, 3) AS LOGIN , NOME
         FROM FUNCIONARIOS;
         
         -- 7.CONTAR QUANTOS FUNCIONARIOS POR DEPARTAMENTO
       SELECT COUNT(F.ID) AS qtFunc, d.nome as DEPARTAMENTO
	  FROM FUNCIONARIOS F
        JOIN DEPARTAMENTOS D ON F.DEPARTAMENTO_ID = D.ID
		GROUP BY D.NOME;
       
    
         
	
         
         -- 8 CONTAR QUANTOS funcionarios existem cargo
         
        SELECT COUNT(F.ID) AS qntFunc, d.nome as CARGO
        FROM FUNCIONARIOS F
        JOIN CARGOS D ON F.CARGO_ID = D.ID
        GROUP BY D.NOME;
        
         