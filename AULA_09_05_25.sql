CREATE DATABASE db_teste_trigger;
USE db_teste_trigger;

CREATE TABLE funcionarios (
id bigint auto_increment primary key,
data_atualizacao varchar(20),
nome  varchar(100),
telefone varchar(50),
email varchar(50),  
data_nascimento varchar(20),
rua  varchar(100),
bairro varchar(50),
cidade varchar(50), 
estado varchar(50) , 
estado_sigla varchar(2),
cargo varchar(50), 
salario float
);

DELIMITER $
CREATE TRIGGER tg_Insert_Funcionarios 
BEFORE DELETE
ON funcionarios
FOR EACH ROW
BEGIN 
	INSERT INTO funcionariosBkp 
    VALUES (NOW(), OLD.id);
END
$
DELIMITER ;

DELIMITER $
CREATE TRIGGER tg_Insert2_Funcionarios 
BEFORE UPDATE
ON funcionarios
FOR EACH ROW
BEGIN 
	INSERT INTO funcionariosBkp 
    VALUES (NOW(), OLD.id );
END
$

DELIMITER ;

CREATE TABLE funcionariosBkp(
data_mod varchar(20),
id bigint
);


INSERT INTO funcionarios
VALUES 
(1,'2001-03-03','Lara Nascimento','+55 81 1457-1005','beatriz16@gmail.com','1993-09-13','Esplanada de da Rosa','Conjunto Serra Verde','Mato Grosso do Sul','Mato Grosso','GO','Carnavalesco',1200.00),
(2,'2004-03-22','Nicolas Souza','41 2670 6492','thiago52@hotmail.com','2016-06-01','Praça de Cardoso, 68','Maria Helena','Ceará','Santa Catarina','AL','Tecnólogo em irrigação e drenagem', 1850.23),
(3,'1972-05-11','Bryan Fernandes','(071) 5429-8380','liviarocha@uol.com.br','2014-02-01','Parque de Moraes, 51','Solimoes','Amapá','Amazonas','MA','Orçamentista',1350.48),
(4,'2008-04-04','Igor Teixeira','(081) 9345-3403','cda-mota@bol.com.br','2009-10-22','Parque de da Rosa, 8','Bernadete','Goiás','Piauí','RN','Corretor de seguros',2350.00),
(5,'2017-12-12','Gustavo Jesus','(071) 1857 2402','dsales@ig.com.br','1996-05-29','Colônia da Rosa, 758','Vila Da Luz','Rio Grande do Norte','São Paulo','TO','Hematologista',4280.15),
(6,'1995-05-22','Sr. Lucas Lopes','+55 71 2250-5789','luizasouza@uol.com.br','1975-05-05','Estação Sales, 49','Vila São João Batista','Acre','Tocantins','PB','Urologista',1800.18),
(7,'2000-11-02','Leonardo da Cruz','(081) 2333 7880','marcos-viniciusfogaca@uol.com.br','1971-03-21','Distrito de Moura, 45','Funcionários','Ceará','Rio de Janeiro','MT','Coordenador',1585.00),
(8,'2022-11-12','Cecília Ferreira','+55 84 3653-8449','ycastro@bol.com.br','1990-04-05','Rua de Rezende, 70','Planalto','Rondônia','Bahia','MA','Tecnólogo em geoprocessamento',1325.25),
(9,'1975-01-15','Pedro Pereira','(031) 9460-4547','upinto@gmail.com','1973-02-19','Colônia Luiz Gustavo Azevedo, 45','Conjunto Celso Machado','Paraíba','Pernambuco','AL','Técnico tributarista',1852.17),
(10,'1982-10-01','Ana Moura','+55 81 9110 6257','rda-cruz@gmail.com','2007-06-20','Fazenda Moraes, 96','Piratininga','Mato Grosso do Sul','Bahia','RS','Corretor de imóveis',1521.18),
(11,'1973-05-17','Camila Viana','+55 51 5544 0339','camposthiago@gmail.com','1985-08-01','Travessa de da Cruz, 413','Grota','Maranhão','Rio Grande do Norte','RS','Repórter',1284.12),
(12,'1985-10-21','Valentina Pires','+55 31 9617 0510','goncalveslucca@hotmail.com','1991-05-23','Jardim Aragão, 3','Novo Aarão Reis','Bahia','Distrito Federal','RR','Guardador de veículos',1842.00),
(13,'1981-07-28','Maria Vitória Almeida','+55 51 4491 8449','ceciliacorreia@ig.com.br','2010-03-14','Viaduto Rafaela Barros, 773','Pilar','Rio Grande do Norte','Maranhão','AC','Remador',2817.15),
(14,'1971-01-11','Ana Beatriz Cunha','+55 (051) 1423 9031','xsouza@ig.com.br','2013-05-02','Sítio Maria Julia da Cunha, 213','Marieta 3ª Seção','Ceará','Amazonas','AP','Lapidário', 2317.08),
(15,'2013-07-19','Yasmin da Mata','(071) 4747 9586','evelyn44@yahoo.com.br','1985-04-21','Parque de Jesus, 41','Nova Cachoeirinha','Roraima','Acre','PA','Manobrista',5171.25),
(16,'1972-02-08','Juan Campos','(061) 5092-9803','nascimentoleticia@gmail.com','1976-07-20','Rodovia de Gomes, 79','São Salvador','Piauí','Roraima','AP','Guitarrista', 1729.91),
(17,'1984-02-07','Danilo da Cruz','41 4606 7774','enzo-gabrieloliveira@hotmail.com','1983-07-21','Colônia de da Paz','Sport Club','Amapá','Sergipe','RR','Clínico geral', 5745.00),
(18,'2017-11-12','Thales Cavalcanti','0500-424-0937','urocha@uol.com.br','1979-08-17','Campo Novaes, 785','Araguaia','Minas Gerais','Minas Gerais','MG','Mestre-de-obras',2345.32),
(19,'2018-11-07','Pedro Miguel Ferreira','(011) 8190 5534','maria-fernandajesus@ig.com.br','1983-05-02','Quadra Ferreira, 2','Lagoinha Leblon','Maranhão','Alagoas','PE','Obstetra',2585.87),
(20,'1998-07-05','Mariana Pereira','0500 228 3792','vitoriaduarte@ig.com.br','1999-10-28','Praia Augusto Correia, 2','Vila Copasa','Pará','Bahia','BA','Intérprete e tradutor de língua de sinais',1234.45),
(21,'1987-02-21','Dra. Bárbara da Paz','(031) 9258-3172','thiagoteixeira@ig.com.br','2018-11-18','Loteamento da Luz','Vila Puc','Bahia','Rondônia','GO','Montador',2585.12),
(22,'1975-06-08','Maria Fernanda Vieira','0300 874 7094','cardosonina@gmail.com','1982-06-17','Vila Mariane Dias, 4','Itapoa','Amazonas','Maranhão','SP','Zelador',5764.72),
(23,'2001-08-26','Alexandre Azevedo','0800 017 0854','rafael67@gmail.com','1971-09-08','Vale Cunha, 790','Cinquentenário','Alagoas','Maranhão','DF','Químico',45645.32),
(24,'2011-01-12','Srta. Letícia Cardoso','(021) 4511-8030','aliciacarvalho@bol.com.br','2010-11-21','Fazenda Carolina Cavalcanti, 846','Diamante','Santa Catarina','Espírito Santo','SE','Aeromoça',2358.91),
(25,'1985-02-12','Mariana da Costa','+55 84 1993-8773','nogueiracaio@yahoo.com.br','1982-08-06','Residencial de Jesus, 641','Conjunto Taquaril','São Paulo','Tocantins','AC','Cineasta',3258.32),
(26,'2004-05-20','Dr. Antônio Cunha','+55 (081) 7203 1424','eazevedo@ig.com.br','1987-07-13','Fazenda Moraes, 7','São Damião','Alagoas','Amazonas','AM','Profissional de comércio exterior',8521.73),
(27,'2023-06-03','Sr. João Teixeira','(011) 7349-1441','alvesjoao-pedro@gmail.com','1974-11-24','Jardim Oliveira, 98','Buritis','Bahia','Rio Grande do Norte','RJ','Médico',2358.82),
(28,'1971-03-21','Luiz Gustavo Gonçalves','+55 (021) 0465 9957','manuelaoliveira@uol.com.br','2012-09-15','Morro Peixoto, 212','Novo Santa Cecilia','Amazonas','Roraima','RS','Engenheiro cartográfico',3255.32),
(29,'2019-06-07','Sra. Emilly Teixeira','(041) 6566-3345','elima@ig.com.br','2002-04-27','Núcleo Silva, 74','Vila Santa Monica 1ª Seção','Paraná','Pará','MA','Nefrologista',2585.45),
(30,'1982-12-09','Catarina das Neves','(061) 7601-6008','vnunes@uol.com.br','1999-10-22','Rodovia de da Rosa','Vila Petropolis','Amapá','Sergipe','PI','Impressor',2171.64),
(31,'2011-06-11','Maria Eduarda Ribeiro','+55 (051) 3307 4583','gustavo-henriquevieira@yahoo.com.br','2022-12-09','Jardim das Neves, 97','Pirineus','Rio Grande do Norte','Rio Grande do Sul','PI','Sonoplasta',6581.22),
(32,'2018-05-31','Luiz Miguel Dias','(061) 5212 9054','mendesclara@hotmail.com','1995-01-25','Via Olivia da Costa, 1','Vila Sesc','Rondônia','Pernambuco','RO','Aeromoça',4128.33),
(33,'2005-06-12','Renan Oliveira','0900-000-4009','acorreia@yahoo.com.br','1980-11-19','Vereda de Alves, 741','Santa Branca','Piauí','São Paulo','AM','Diretor de fotografia',7841.32),
(34,'1975-05-04','Bárbara Monteiro','(071) 5766-7349','maria19@uol.com.br','2003-08-14','Área de Rezende, 7','Vila São Gabriel Jacui','Amazonas','Mato Grosso','PI','Profissional de efeitos especiais',21345.18),
(35,'1974-05-06','Rafaela Moura','84 3735 2243','tda-costa@hotmail.com','2012-03-10','Praia Maria Sophia Correia, 88','Marmiteiros','Paraná','Piauí','RJ','Engenheiro de aquicultura',1577.32),
(36,'1980-01-24','Dr. Yago Silva','21 1850-6286','lopesheloisa@gmail.com','2008-12-21','Alameda de da Paz, 907','Solimoes','Rondônia','Pará','RR','Engenheiro de energia',4534.32),
(37,'2006-11-02','Maria Alice Teixeira','(081) 3331-7456','rmelo@ig.com.br','1996-06-27','Favela João Cunha, 86','Venda Nova','Amazonas','Amazonas','PB','Geofísico',2427.32),
(38,'1996-09-06','Henrique Gomes','71 7255-2516','aribeiro@yahoo.com.br','1985-10-11','Condomínio de Porto','Nossa Senhora Da Conceição','Distrito Federal','Acre','RN','Produtor de eventos',2787.14),
(39,'1986-07-07','Heitor Costa','0800-374-5846','zramos@hotmail.com','1984-05-05','Alameda de Porto, 37','Jardim São José','Mato Grosso do Sul','Paraná','SC','Produtor de eventos',2775.25),
(40,'1986-08-23','Lara Moraes','71 6994 7145','das-nevesrenan@gmail.com','2005-09-20','Setor de da Conceição, 28','Marajó','São Paulo','Roraima','RJ','Feirante',7578.32),
(41,'1989-09-05','Ana Dias','0300 511 6247','lda-paz@gmail.com','1970-03-19','Alameda de Campos, 92','Vila Sesc','Pernambuco','Paraíba','RJ','Radialista',3132.00),
(42,'1989-08-22','Luna Teixeira','+55 (041) 0198-6798','aliceviana@hotmail.com','1990-01-30','Condomínio Emanuella Souza, 91','Glória','Amapá','Santa Catarina','AC','Agente de combate à endemias',2585.97),
(43,'1970-03-30','Lucca Nascimento','(011) 2715-1890','ysantos@ig.com.br','2022-01-16','Estação de Cardoso, 64','Cidade Nova','São Paulo','Paraná','ES','Nutrologista',2877.00),
(44,'2005-04-03','André Azevedo','+55 (081) 4789 3431','milena20@yahoo.com.br','1994-03-10','Distrito Julia Sales, 604','Vila Cemig','Alagoas','Paraná','RN','Assistente de produção',7111.78),
(45,'2022-12-26','Vitor Ramos','+55 (021) 3156-3110','ocorreia@bol.com.br','1991-01-19','Morro Fogaça, 52','Céu Azul','Rio Grande do Norte','Rio Grande do Norte','ES','Radialista programador',11214.79),
(46,'2010-07-08','Nina Costela','0800 156 5616','pcardoso@bol.com.br','1973-07-31','Setor da Rosa, 23','Nossa Senhora Do Rosário','Alagoas','Bahia','MG','Relações públicas',2545.32),
(47,'1984-03-09','Dr. Vitor Moraes','(071) 8061 5291','rebeca91@hotmail.com','1993-08-20','Jardim de Barbosa, 385','Cabana Do Pai Tomás','Bahia','Rio Grande do Sul','TO','Alfaiate',2300.32),
(48,'1978-02-19','Luiz Felipe Ferreira','(011) 7154 1811','xcorreia@bol.com.br','2014-06-06','Lago Duarte','Mangabeiras','Santa Catarina','Goiás','SE','Engenheiro de projetos',2600.32),
(49,'1981-06-01','Leonardo Carvalho','51 8382 0288','eduardoalmeida@gmail.com','2020-04-14','Passarela de Barbosa, 88','Vila Da Luz','Distrito Federal','Ceará','DF','Capelão',2575.32),
(50,'2005-10-08','Theo Nunes','+55 61 1973 3711','luizada-luz@uol.com.br','1993-12-21','Jardim de Farias, 2','Guarani','Alagoas','Ceará','AL','Zelador',5275.32);

 -- DELETE FROM funcionarios WHERE id = 1;


select * from funcionarios;




CREATE TABLE bkpupdate (
  data_modificacao VARCHAR(20),
  id BIGINT,
  data_atualizacao VARCHAR(20),
  nome VARCHAR(100),
  telefone VARCHAR(50),
  email VARCHAR(50),  
  data_nascimento VARCHAR(20),
  rua VARCHAR(100),
  bairro VARCHAR(50),
  cidade VARCHAR(50), 
  estado VARCHAR(50), 
  estado_sigla VARCHAR(2),
  cargo VARCHAR(50), 
  salario FLOAT
);

DELIMITER $
CREATE TRIGGER tg_Update_Backup
BEFORE UPDATE ON funcionarios
FOR EACH ROW
BEGIN
  INSERT INTO bkpupdate 
  VALUES (
    NOW(),
    OLD.id,
    OLD.data_atualizacao,
    OLD.nome,
    OLD.telefone,
    OLD.email,
    OLD.data_nascimento,
    OLD.rua,
    OLD.bairro,
    OLD.cidade,
    OLD.estado,
    OLD.estado_sigla,
    OLD.cargo,
    OLD.salario
  );
  

END
$

DELIMITER ;

SELECT * FROM bkpupdate;
SELECT * FROM funcionarios;
UPDATE funcionarios SET nome = 'Lara Teste' WHERE id = 2;

SELECT * FROM bkpupdate WHERE id = 2;

SHOW TRIGGERS;


