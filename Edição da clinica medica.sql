-- usa a tabela 
USE clinica_medica_db;

-- deleta e tabela de convenio
drop table convenio;

-- cria uma nova coluna na linha de paciente
alter table paciente
add column convenio varchar(80) null;

-- remove a coluna da tabela de agendamento
alter table agendamento
drop column observacoes;

-- modifica o tipo de dado  da coluna de valor do agendamento
alter table agendamento
modify column valor decimal(10,2) not null;

-- renomeia uma coluna da tabela de agendamento
alter table agendamento
rename column sala to consultorio;

-- renomia a tabela de agendamento para consulta
rename table agendamento to consulta;