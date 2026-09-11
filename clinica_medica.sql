CREATE DATABASE IF NOT EXISTS clinica_medica_db;

USE clinica_medica_db;

CREATE TABLE IF NOT EXISTS medico(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL, 
    crm VARCHAR(20) NOT NULL,
    especialidade varchar(80) not null,
    telefone varchar(20) not null,
    email varchar(120) not null
);

CREATE TABLE IF NOT EXISTS paciente(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL, 
    cpf varchar(15) NOT NULL,
    data_nascimento date not null,
    rua varchar(250) not null, 
    numero varchar(10) not null,
    cidade varchar(250) not null,
    cep varchar(25) not null,
    telefone varchar(20) not null,
    email varchar(120) not null
);

CREATE TABLE IF NOT EXISTS convenio(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL, 
    registro_ans varchar(20) not null,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS agendamento(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_medico int not null,
    id_paciente int NOT NULL, 
    data_hora datetime not null,
    sala varchar(250) not null,
    valor double not null,
    observacoes text null,
    FOREIGN KEY (id_medico) REFERENCES medico (id),
	FOREIGN KEY (id_paciente) REFERENCES paciente (id)
);
--- feito até aqui
