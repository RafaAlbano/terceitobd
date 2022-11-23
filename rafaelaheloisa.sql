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
(REATE TABLE salao_obra (
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
h005,005,'17:24:38','21:24:38','2022-09-28'),
(006,006,'17:24:38','21:24:38','2022-09-28'),
(007,007,'17:24:38','21:24:38','2022-09-28'),
(008,008,'7:24:38','21:24:38','2022-09-28'),
(010,009,':24:38','21:24:38','2022-09-28'),
(011,010,'17:24:38','21:24:38','2022-09-28'),
(012,011,'17:24:38','21:24:38','2022-09-28'),
(013,012,'17:24:38','21:24:38','2022-09-28'),
(014,013,'17:24:38','21:24:38','2022-09-28'),
(015,014,'17:24:38','21:24:38','2022-09-28'),
(001,001,'17:24:38','21:24:38','2022-09-28');

CREATE TABLE tipo_funcionario (
cod_tipo_funcionario int auto_increment PRIMARY KEY,
tipo_funcionario varchar(80) not null
);
ome_mat_prima varchar(80) not null
);

CREATE TABLE funcionario (
id_funcionario int auto_increment PRIMARY KEY,
nome_funcionario varchar(80) not null,
salario_funcionario decimal(10,2) not null,
cpf_funcionario varchar(14) not null unique,
cod_tipo_funcionario int not null,
FOREIGN KEY(cod_tipo_funcionario) REFERENCES tipo_funcionario (cod_tipo_funcionario)
);

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
CREATE TABLE materia_prima (
cod_mat_prima int auto_increment PRIMARY KEY,
qtd_est_mat int not null,
nome_mat_prima varchar(80) not null
);

CREATE TABLE funcionario (
id_funcionario int auto_increment PRIMARY KEY,
nome_funcionario varchar(80) not null,
salario_funcionario decimal(10,2) not null,
cpf_funcionario varchar(14) not null unique,
cod_tipo_funcionario int not null,
FOREIGN KEY(cod_tipo_funcionario) REFERENCES tipo_funcionario (cod_tipo_funcionario)
);

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
ALTER TABLE obra ADD FOREIGN KEY(cod_tipo_obra) REFERENCES tipo_obra (cod_tipo_obra);1,3,"mumia"),
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
h005,005,'17:24:38','21:24:38','2022-09-28'),
(006,006,'17:24:38','21:24:38','2022-09-28'),
(007,007,'17:24:38','21:24:38','2022-09-28'),
(008,008,'7:24:38','21:24:38','2022-09-28'),
(010,009,':24:38','21:24:38','2022-09-28'),
(011,010,'17:24:38','21:24:38','2022-09-28'),
(012,011,'17:24:38','21:24:38','2022-09-28'),
(013,012,'17:24:38','21:24:38','2022-09-28'),
(014,013,'17:24:38','21:24:38','2022-09-28'),
(015,014,'17:24:38','21:24:38','2022-09-28'),
(001,001,'17:24:38','21:24:38','2022-09-28');

CREATE TABLE tipo_funcionario (
cod_tipo_funcionario int auto_increment PRIMARY KEY,
tipo_funcionario varchar(80) not null
);

CREATE TABLE materia_prima (
cod_mat_prima int auto_increment PRIMARY KEY,
qtd_est_mat int not null,
nome_mat_prima varchar(80) not null
);

CREATE TABLE funcionario (
id_funcionario int auto_increment PRIMARY KEY,
nome_funcionario varchar(80) not null,
salario_funcionario decimal(10,2) not null,
cpf_funcionario varchar(14) not null unique,
cod_tipo_funcionario int not null,
FOREIGN KEY(cod_tipo_funcionario) REFERENCES tipo_funcionario (cod_tipo_funcionario)
);

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
ALTER TABLE obra ADD FOREIGN KEY(cod_tipo_obra) REFERENCES tipo_obra (cod_tipo_obra);ora_saida time not null,
data_atividade date not null
);
insert INTO atividade (ob_cod_obra,func_id_funcionario,hora_entrada,hora_saida,data_atividade) VALUES
(001,001,'17:24:38','21:24:38','2022-09-28'),
(002,002,'17:24:38','21:24:38','2022-09-28'),
(003,003,'17:24:38','21:24:38','2022-09-28'),
(004,004,'17:24:38','21:24:38','2022-09-28'),
(005,005,'17:24:38','21:24:38','2022-09-28'),
(006,006,'17:24:38','21:24:38','2022-09-28'),
(007,007,'17:24:38','21:24:38','2022-09-28'),
(008,008,'7:24:38','21:24:38','2022-09-28'),
(010,009,':24:38','21:24:38','2022-09-28'),
(011,010,'17:24:38','21:24:38','2022-09-28'),
(012,011,'17:24:38','21:24:38','2022-09-28'),
(013,012,'17:24:38','21:24:38','2022-09-28'),
(014,013,'17:24:38','21:24:38','2022-09-28'),
(015,014,'17:24:38','21:24:38','2022-09-28'),
(001,001,'17:24:38','21:24:38','2022-09-28');

CREATE TABLE tipo_funcionario (
cod_tipo_funcionario int auto_increment PRIMARY KEY,
tipo_funcionario varchar(80) not null
);

CREATE TABLE materia_prima (
cod_mat_prima int auto_increment PRIMARY KEY,
qtd_est_mat int not null,
nome_mat_prima varchar(80) not null
);

CREATE TABLE funcionario (
id_funcionario int auto_increment PRIMARY KEY,
nome_funcionario varchar(80) not null,
salario_funcionario decimal(10,2) not null,
cpf_funcionario varchar(14) not null unique,
cod_tipo_funcionario int not null,
FOREIGN KEY(cod_tipo_funcionario) REFERENCES tipo_funcionario (cod_tipo_funcionario)
);

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
