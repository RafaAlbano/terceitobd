-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
CREATE DATABASE museu_joaoligiarafahelo;
USE museu_joaoligiarafahelo;


CREATE TABLE autor (
cod_autor int PRIMARY KEY AUTO_INCREMENT,
nacionalidade_autor char(3) not null,
nome_autor varchar(80) not null
);

CREATE TABLE salao (
cod_salao int PRIMARY KEY AUTO_INCREMENT,
num_salao int not null,
andar_museu int not null,
salao varchar(80) not null
);


CREATE TABLE salao_obra (
salao_cod_salao int not null,
obra_cod_obra int not null,
posicao_salao varchar(80) not null,
FOREIGN KEY(salao_cod_salao) REFERENCES salao (cod_salao)
);

CREATE TABLE atividade (
ob_cod_obra int not null,
func_id_funcionario int not null,
hora_entrada time not null,
hora_saida time not null,
data_atividade date not null
);

CREATE TABLE tipo_funcionario (
cod_tipo_funcionario int PRIMARY KEY AUTO_INCREMENT,
tipo_funcionario varchar(80) not null
);

CREATE TABLE materia_prima (
cod_mat_prima int PRIMARY KEY AUTO_INCREMENT,
qtd_est_mat int not null,
nome_mat_prima varchar(80) not null
);

CREATE TABLE funcionario (
id_funcionario int PRIMARY KEY AUTO_INCREMENT,
nome_funcionario varchar(80) not null,
salario_funcionario decimal(10,2) not null,
cpf_funcionario varchar(14) not null unique,
cod_tipo_funcionario int not null,
FOREIGN KEY(cod_tipo_funcionario) REFERENCES tipo_funcionario (cod_tipo_funcionario)
);

CREATE TABLE manutencao (
mnt_obra int PRIMARY KEY AUTO_INCREMENT,
data_termi_mnt date not null,
custo_mnt decimal(10,2) not null,
data_ini_mnt date not null,
desc_mnt varchar(80) not null,
cod_obra int not null,
func_id_funcionario int not null,
FOREIGN KEY(func_id_funcionario) REFERENCES funcionario (id_funcionario)
);

CREATE TABLE obra (
cod_obra int PRIMARY KEY AUTO_INCREMENT,
ano_obra year not null,
titu_obra varchar(80) not null unique,
peso_obra decimal(10,2) null,
material_obra varchar(80) null,
desc_estilo_obra varchar(80) null,
cod_autor int not null,
cod_tipo_obra int not null,
FOREIGN KEY(cod_autor) REFERENCES autor (cod_autor)
);

CREATE TABLE tipo_obra (
cod_tipo_obra int PRIMARY KEY AUTO_INCREMENT,
desc_tipo_obra varchar(80) not null
);

CREATE TABLE manu_mat (
Campo_1 int not null,
Campo_2 int not null,
qtd_mat_mnt varchar(15) not null,
FOREIGN KEY(Campo_1) REFERENCES manutencao (mnt_obra),
FOREIGN KEY(Campo_2) REFERENCES materia_prima (cod_mat_prima)
);

ALTER TABLE salao_obra ADD FOREIGN KEY(obra_cod_obra) REFERENCES obra (cod_obra);
ALTER TABLE atividade ADD FOREIGN KEY(ob_cod_obra) REFERENCES obra (cod_obra);
ALTER TABLE atividade ADD FOREIGN KEY(func_id_funcionario) REFERENCES funcionario (id_funcionario);
ALTER TABLE manutencao ADD FOREIGN KEY(cod_obra) REFERENCES obra (cod_obra);
ALTER TABLE obra ADD FOREIGN KEY(cod_tipo_obra) REFERENCES tipo_obra (cod_tipo_obra);

insert INTO `autor` (nacionalidade_autor,nome_autor) VALUES
('CHI','joao'),
('ARG','ligia'),
('HUN','gabriel'),
('BRA','roberto'),
('POR','maria'),
('EUA','alessandra'),
('BRA','julia'),
('CHI','roberta'),
('ARG','caio'),
('BRA','augusto'),
('CHI','davi'),
('ESP','ivo'),
('ARG','herick'),
('EUA','gabriele'),
('EUA','heloisa'),
('MEX','rafaela'),
('MEX','leticia'),
('CHI','mavi'),
('ARG','marcus'),
('BRA','pedro');

select * from autor;

Insert INTO `salao_obra` (salao_cod_salao, obra_cod_obra, posicao_salao) VALUES
(001,002,"frente"),
(002,003,"lado"),
(003,005,"esquerda"),
(004,008,"direita"),
(005,003,"frente"),
(006,007,"lado"),
(007,003,"esquerda"),
(008,002,"direita"),
(009,010,"frente"),
(010,09,"lado"),
(011,018,"direita"),
(012,011,"eaquerda"),
(013,012,"frente"),
(014,014,"lado"),
(015,006,"direita"),
(016,012,"esquerda"),
(017,012,"lado"),
(018,013,"frente"),
(019,001,"frente"),
(020,006,"frente");



Insert INTO `salao` (num_salao,andar_museu,salao) VALUES
(4,1,"joia"),
(4,3,"pintura"),
(1,6,"livro"),
(4,9,"arte"),
(1,6,"joias"),
(2,2,"anos90"),
(6,6,"estatuas"),
(8,4,"escada"),
(3,5,"lustre"),
(8,8,"colar"),
(4,1,"diario"),
(1,2,"diamante"),
(2,1,"brinco"),
(8,9,"luvas"),
(3,7,"carros"),
(4,5,"carruagem"),
(4,9,"anel"),
(1,3,"mumia"),
(7,5,"quadros"),
(4,5,"pessoas");

Insert INTO `salao_obra` (salao_cod_salao, obra_cod_obra, posicao_salao) VALUES
(1,002,"frente"),
(2,003,"lado"),
(3,005,"esquerda"),
(4,008,"direita"),
(5,003,"frente"),
(6,007,"lado"),
(7,003,"esquerda"),
(8,002,"direita"),
(9,010,"frente"),
(10,09,"lado"),
(11,018,"direita"),
(12,011,"eaquerda"),
(13,012,"frente"),
(14,014,"lado"),
(15,006,"direita"),
(16,012,"esquerda"),
(17,012,"lado"),
(18,013,"frente"),
(19,001,"frente"),
(20,006,"frente");

insert INTO `tipo_obra` (desc_tipo_obra) VALUES 
('pintura'),
('escultura');

Insert INTO `obra` ( ano_obra, titu_obra, peso_obra, material_obra, desc_estilo_obra,cod_autor,cod_tipo_obra ) VALUES 
('2019','Mona Lisa',10,'madeira','desc1',20,1),
('2020','Guernica',20,'pincel','desc2',10,2),
('2020','O beijo',10,'argila','desc3',20,1),
('2020','O grito',20,'escada','desc4',10,2),
('2019','N° 5',10,'caneta','desc5',20,1),
('2020','As meninas',30,'penas','desc6',10,1),
('2015','Os Comedores de batata',10,'vidro','desc7',20,2),
('2017','A persistência de memórias',20,'pérolas','desc8',10,1),
('2010','Impressão, sol nascente',40,'tecidos','desc9',20,2),
('2009','Os Fuzilamentos de Três de Maio',10,'obras','desc10',10,1),
('2005','A moça com brinco de pérolas',30,'quadros','desc11',12,2),
('2019','O almoço dos barqueiros',40,'folhas','desc12',13,2),
('2019','Hospital de henry ford',20,'ferro','desc13',12,1),
('2022','os retirantes',70,'arame','desc14',17,2),
('2012','Abaporu',17,'tinta azul','desc15',10,1),
('2009','A ronda noturna',10,'argamassa','desc16',10,2),
('2003','A noite estrelada',20,'gesso','desc17',11,1),
('2019','Nu descendo uma escada',60,'tinta branca','desc18',10,1),
('2002','O trabalho de uma imagem',10,'gliter','des19',17,2),
('2016','As duas fridas',50,'porpurina','desc20',10,2);


Insert INTO`tipo_funcionario`(tipo_funcionario) VALUES
("Guarda"),
("Restauradores"),
("Operário de limpeza");


insert INTO `funcionario` ( nome_funcionario, salario_funcionario,cpf_funcionario,cod_tipo_funcionario) VALUES
("Luana",1820.20,"111.222.444-34",1),
("Lara",2820.20,"111.333.444-34",2),
("Lina",3280.20,"181.222.444-53",1),
("Ana",4270.20,"111.292.499-34",1),
("Maria",5280.20,"881.222.484-38",3),
("bianca",6270.20,"111.292.444-94",2),
("Sara",720.20,"151.225.454-34",1),
("Sarah",820.20,"111.222.443-34",2),
("luli",920.20,"111.282.444-34",2),
("Bianca",9280.20,"111.485.444-34",1),
("Larisa",1420.20,"278.222.484-34",1),
("Larissa",1290.20,"111.222.276-34",3),
("Lana",1280.20,"111.202.444-90",2),
("Lua",1980.20,"131.232.444-34",1),
("Lana",1234.20,"911.222.146-34",1),
("bibi",1240.20,"111.152.444-34",3),
("Leo",1230.20,"981.222.444-34",2),
("Luan",1260.20,"111.202.874-11",1),
("Gigi",1250.20,"111.872.444-34",1),
("Vinicius",1420.20,"111.098.444-34",1);

insert INTO `atividade` (ob_cod_obra,func_id_funcionario,hora_entrada,hora_saida,data_atividade) VALUES
(61,41,'10:29:28','21:24:38','2021-03-24'),
(62,42,'14:25:28','22:34:37','2022-09-28'),
(63,43,'13:24:38','23:34:31','2022-04-24'),
(64,44,'10:34:38','21:14:32','2022-05-25'),
(65,45,'11:40:49','20:34:28','2022-06-23'),
(66,46,'18:24:56','00:32:16','2022-02-22'),
(67,47,'17:14:39','12:22:49','2022-07-28'),
(68,48,'07:24:38','21:20:18','2022-08-28'),
(69,49,'00:24:38','08:21:08','2022-10-28'),
(70,50,'1:24:38','21:24:38','2022-09-29'),
(71,51,'10:04:08','24:14:57','2022-09-28'),
(72,52,'17:24:38','00:00:00','2022-09-12'),
(73,53,'19:29:39','21:27:34','2022-11-15'),
(74,54,'01:36:37','01:18:34','2022-11-14'),
(75,55,'17:28:38','06:14:35','2022-09-18'),
(76,56,'18:31:38','22:21:8','2012-12-10'),
(77,57,'16:45:38','23:24:00','2022-07-31'),
(78,58,'17:55:38','24:33:08','2022-09-30'),
(79,59,'15:20:38','11:54:38','2022-09-12'),
(80,60,'12:34:43','15:34:38','2020-12-22');


Insert INTO `materia_prima`(qtd_est_mat,nome_mat_prima) VALUES 
(2,'argila'),
(122,'madeira'),
(111,'pincéis'),
(234,'lapis'),
(44,'ferro'),
(11,'arame'),
(22,'argamassa'),
(12,'gesso'),
(1111,'tinta azul'),
(209,'tinta branca'),
(23,'quadros'),
(213,'folhas'),
(22,'canetas'),
(23,'penas'),
(77,'glitter'),
(90,'purpurina'),
(80,'lantejola'),
(111,'perolas'),
(456,'vidro'), 
(226,'tecido');


insert INTO `manutencao` (data_termi_mnt, custo_mnt, data_ini_mnt, desc_mnt, cod_obra, func_id_funcionario) VALUES 
('2022-10-30',30.30,'2022-01-02','portas',65,41),
('2022-11-20',20.30,'2022-02-02','quadros',66,42),
('2022-12-30',122.30,'2022-09-02','dispensers',67,43),
('2022-12-31',34.45,'2021-01-02','galerias',68,44),
('2022-10-24',30.50,'2022-01-03','aluminio',69,45),
('2022-05-20',30.30,'2022-01-06','portas',70,46),
('2022-12-30',930.30,'2022-11-12','ceramicas',71,47),
('2022-12-30',30.30,'2022-01-02','retratos',72,48),
('2021-10-10',50.30,'2021-01-08','esposições',73,49),
('2021-10-30',60.30,'2021-01-02','portas',74,50),
('2022-10-12',310.20,'2022-02-02','janelas',75,51),
('2022-11-10',1000.30,'2022-11-02','cortinas',76,52),
('2022-10-30',30.20,'2022-03-22','metais',77,53),
('2022-07-30',390.30,'2021-01-02','estantes',78,54),
('2022-08-30',50.50,'2022-01-05','luzes',79,55),
('2022-11-30',30.20,'2022-11-02','pisos',80,56),
('2022-01-30',30.30,'2022-01-02','holofotes',71,57),
('2022-10-30',36.30,'2022-01-02','portas',80,58),
('2022-10-30',30.30,'2022-02-02','retratos',80,59),
('2022-10-30',30.30,'2021-03-02','portas',80,60);


Insert INTO `manu_mat` (Campo_1, Campo_2, qtd_mat_mnt) VA-- Geração de Modelo físico
2
-- Sql ANSI 2003 - brModelo.
3
CREATE DATABASE museu_rafahelo;
4
USE museu_rafahelo;
5
​
6
​
7
CREATE TABLE autor (
8
cod_autor int auto_increment PRIMARY KEY,
9
nacionalidade_autor char(3) not null,
10
nome_autor varchar(80) not null
11
);
12
insert INTO `autor` (nacionalidade_autor,nome_autor) VALUES
13
('CHI','joao'),
14
('ARG','ligia'),
15
('HUN','gabriel'),
16
('BRA','roberto'),
17
('POR','maria'),
18
('EUA','alessandra'),
19
('BRA','julia'),
20
('CHI','roberta'),
21
('ARG','caio'),
22
('BRA','augusto'),
23
('CHI','davi'),
24
('ESP','ivo'),
25
('ARG','herick'),
26
('EUA','gabriele'),
27
('EUA','heloisa'),
28
('MEX','rafaela'),
29
('MEX','leticia'),
30
('CHI','mavi'),
31
('ARG','marcus'),
32
('BRA','pedro');
33
​
34
​
35
CREATE TABLE salao (
36
cod_salao int auto_increment PRIMARY KEY,
37
num_salao int not null,
38
andar_museu int not null,
39
salao varchar(80) not null
40
);
41
Insert INTO `salao` (num_salao,andar_museu,salao) VALUES
42
(4,1,"joia"),
43
(4,3,"pintura"),
44
(1,6,"livro"),
45
(4,9,"arte"),LUES
(41,1,211),
(42,2,200),
(43,3,300),
(44,4,350),
(45,5,220),
(46,6,300),
(47,7,200),
(48,8,430),
(49,9,450),
(50,10,222),
(51,11,400),
(52,12,500),
(53,13,300),
(54,14,200),
(55,15,250),
(56,16,211),
(57,17,271),
(58,18,2200),
(59,19,400),
(60,20,500);
