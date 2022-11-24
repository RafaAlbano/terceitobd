-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
CREATE DATABASE museu_rafahelo;
USE museu_rafahelo;


CREATE TABLE autor (
cod_autor int auto_increment PRIMARY KEY,
nacionalidade_autor char(3) not null,
nome_autor varchar(80) not null
);
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


CREATE TABLE salao (
cod_salao int auto_increment PRIMARY KEY,
num_salao int not null,
andar_museu int not null,
salao varchar(80) not null
);
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

CREATE TABLE salao_obra (
salao_cod_salao int not null,
obra_cod_obra int not null,
posicao_salao varchar(80) not null,
FOREIGN KEY(salao_cod_salao) REFERENCES salao (cod_salao)
);
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

CREATE TABLE atividade (
ob_cod_obra int not null,
func_id_funcionario int not null,
hora_entrada time not null,
hora_saida time not null,
data_atividade date not null
);
insert INTO `atividade` (ob_cod_obra,func_id_funcionario,hora_entrada,hora_saida,data_atividade) VALUES
(001,001,'10:29:28','21:24:38','2021-03-24'),
(002,002,'14:25:28','22:34:37','2022-09-28'),
(003,003,'13:24:38','23:34:31','2022-04-24'),
(004,004,'10:34:38','21:14:32','2022-05-25'),
(005,005,'11:40:49','20:34:28','2022-06-23'),
(006,006,'18:24:56','00:32:16','2022-02-22'),
(007,007,'17:14:39','12:22:49','2022-07-28'),
(008,008,'07:24:38','21:20:18','2022-08-28'),
(010,009,'00:24:38','08:21:08','2022-10-28'),
(011,010,'1:24:38','21:24:38','2022-09-29'),
(001,011,'10:04:08','24:14:57','2022-09-28'),
(042,012,'17:24:38','00:00:00','2022-09-12'),
(045,013,'19:29:39','21:27:34','2022-11-15'),
(087,014,'01:36:37','01:18:34','2022-11-14'),
(091,015,'17:28:38','06:14:35','2022-09-18'),
(057,016,'18:31:38','22:21:8','2012-12-10'),
(057,017,'16:45:38','23:24:00','2022-07-31'),
(035,018,'17:55:38','24:33:08','2022-09-30'),
(025,019,'15:20:38','11:54:38','2022-09-12'),
(016,020,'12:34:43','15:34:38','2020-12-22');

CREATE TABLE tipo_funcionario (
cod_tipo_funcionario int auto_increment PRIMARY KEY,
tipo_funcionario varchar(80) not null
);
Insert INTO`tipo_funcionario`(tipo_funcionario) VALUES
("Guarda"),
("Restauradores"),
("Operário de limpeza");

CREATE TABLE materia_prima (
cod_mat_prima int auto_increment PRIMARY KEY,
qtd_est_mat int not null,
nome_mat_prima varchar(80) not null
);
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

CREATE TABLE funcionario (
id_funcionario int auto_increment PRIMARY KEY,
nome_funcionario varchar(80) not null,
salario_funcionario decimal(10,2) not null,
cpf_funcionario varchar(14) not null unique,
cod_tipo_funcionario int not null,
FOREIGN KEY(cod_tipo_funcionario) REFERENCES tipo_funcionario (cod_tipo_funcionario)
);
insert INTO `funcionario` ( nome_funcionario, salario_funcionario,cpf_funcionario,cod_tipo_funcionario) VALUES
("Luana",1820.20,"111.222.444-34",001),
("Lara",2820.20,"111.333.444-34",002),
("Lina",3280.20,"181.222.444-53",001),
("Ana",4270.20,"111.292.499-34",001),
("Maria",5280.20,"881.222.484-38",001),
("bianca",6270.20,"111.222.444-34",001),
("Sara",720.20,"111.222.444-34",001),
("Sarah",820.20,"111.222.444-34",001),
("luli",920.20,"111.222.444-34",001),
("Bianca",9280.20,"111.222.444-34",001),
("Larisa",1420.20,"111.222.444-34",001),
("Larissa",1290.20,"111.222.444-34",001),
("Lana",1280.20,"111.222.444-34",001),
("Luana",1980.20,"111.222.444-34",001),
("Luana",1234.20,"111.222.444-34",001),
("Luana",1240.20,"111.222.444-34",001),
("Luana",1230.20,"111.222.444-34",001),
("Luana",1260.20,"111.222.444-34",001),
("Luana",1250.20,"111.222.444-34",001),
("Luana",1420.20,"111.222.444-34",001);

CREATE TABLE manutencao (
mnt_obra int auto_increment PRIMARY KEY,
data_termi_mnt date not null,
custo_mnt decimal(10,2) not null,
data_ini_mnt date not null,
desc_mnt varchar(80) not null,
cod_obra int not null,
func_id_funcionario int not null,
FOREIGN KEY(func_id_funcionario) REFERENCES funcionario (id_funcionario)
);

CREATE TABLE obra (
cod_obra int auto_increment PRIMARY KEY,
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
cod_tipo_obra int auto_increment PRIMARY KEY,
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
