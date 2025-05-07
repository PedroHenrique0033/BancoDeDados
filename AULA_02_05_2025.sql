CREATE DATABASE escola;

-- TABELAS DE ALUNOS

CREATE TABLE alunos (
	id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    email VARCHAR(100)
);


-- TABELA CURSOS

CREATE TABLE cursos (
	id_curso INT PRIMARY KEY,
    nome_curso VARCHAR(100),
    carga_horaria INT 
);

-- TABELA MATRICULAS

CREATE TABLE matriculas (
	id_matricula INT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);


-- ADICIONAR COLUNA TELEFONE NA TABELA ALUNOS

ALTER TABLE alunos ADD telefone VARCHAR(20);


-- MODIFIQUE TIPO DE COLUNA carga_horaria PARA SMALLINT

ALTER TABLE cursos MODIFY carga_horaria SMALLINT;


-- EXCLUA TAABELA MATRICULAS (APENAS PARA TREINAR DROP, RECIRAR DEPOIS SE QUISER CONTINUAR).

DROP TABLE matriculas;


-- EXERCICIOS DML:


-- INSERIR ALUNOS

INSERT INTO alunos(id_aluno, nome, data_nascimento, email, telefone)
VALUES
(1, 'Ana Souza', '2000-05-10', 'ana@gmail.com', '119887654321'),
(2, 'Carlos Lima', '1999-11-22', 'carlos11@gmail.com', '11912345678');

-- INSERIR CURSOS

INSERT INTO cursos (id_curso, nome_curso, carga_horaria)
VALUES
(101, 'Lógica de Programação', 60),
(102, 'Banco de Dados', 80);

-- INSERIR MATRICULAS 

INSERT INTO matriculas (id_matricula, id_aluno, id_curso, data_matricula)
VALUES
(1001, 1, 101, '2024-03-10'),
(1002, 2, 102, '2024-03-12');


-- ATUALIZE TELEFONE DE ANA SOUZA PARA '11911112222'.

UPDATE alunos SET telefone = '11911112222' WHERE id_aluno = 1;

-- REMOVA O CURSO DE NOME 'Lógica de Programaçãao'

DELETE FROM matriculas WHERE id_curso = (
  SELECT id_curso FROM cursos WHERE nome_curso = 'Lógica de Programação'
);

DELETE FROM cursos WHERE nome_curso = 'Lógica de Programação';


-- REINSIRA ESSE CURSO COM ID 103 E CARGA HORARIA 75.

INSERT INTO cursos (id_curso, nome_curso, carga_horaria)
VALUES (103, 'Lógica de Programação', 75);


-- EXERCICIOS DQL

-- CONSULTA BASICA

-- todos alunos
SELECT * FROM alunos;

-- TODOS CURSOS COM MAIS DE 70 HORAS 
SELECT * FROM cursos WHERE carga_horaria > 70;

-- MATRICULAS FEITAS AAPÓS 01/03/2024
SELECT * FROM matriculas WHERE data_matricula > '2024-03-01';


-- LISTE NOOMES DOS ALUNOS  COM SUA RESPECTIVAS DATAS DE NASCIMENTO.

SELECT nome, data_nascimento FROM alunos;

-- LISTE OS CURSOS ORDENADOS PELA CARGA HORARIA(DO MAIOR PARA MENOR).

SELECT * FROM cursos ORDER BY carga_horaria DESC;

--  EXIBA OS NOMES DOS ALUNOS E OS NOMES DO CURSOS EM QUE ESTÃO MATRICULADOS.

SELECT a.nome AS aluno, c.nome_curso AS curso
FROM alunos a
JOIN matriculas m ON a.id_aluno = m.id_aluno
JOIN cursos c ON c.id_curso = m.id_curso;


-- EXIBINDO NOME DO ALUNO, NOME DO CURSO, IDADE E DATA DA MATRICULA.

SELECT 
    a.nome AS nome_aluno,
    c.nome_curso AS nome_curso,
    TIMESTAMPDIFF(YEAR, a.data_nascimento, CURDATE()) AS idade,
    m.data_matricula
FROM 
    matriculas m
JOIN 
    alunos a ON m.id_aluno = a.id_aluno
JOIN 
    cursos c ON m.id_curso = c.id_curso;
