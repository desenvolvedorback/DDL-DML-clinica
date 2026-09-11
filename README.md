# 🏥 Clínica Médica — Banco de Dados

Projeto de banco de dados relacional desenvolvido em **MySQL** para gerenciamento de uma clínica médica.

O projeto demonstra tanto a **criação inicial da estrutura do banco** quanto a **edição e evolução das tabelas**, utilizando comandos de **DDL (Data Definition Language)** como `ALTER TABLE`, `DROP TABLE`, `RENAME TABLE`, `ADD COLUMN`, `DROP COLUMN` e `MODIFY COLUMN`.

---

## 🗄️ Tecnologias

* **MySQL**
* **SQL**
* Banco de dados relacional
* DDL — Data Definition Language
* Chaves primárias e estrangeiras
* `AUTO_INCREMENT`
* `ALTER TABLE`
* `DROP TABLE`
* `RENAME TABLE`
* `ADD COLUMN`
* `DROP COLUMN`
* `MODIFY COLUMN`

---

## 📌 Banco de Dados

O banco utilizado pelo projeto é:

```text
clinica_medica_db
```

A estrutura inicial possui quatro tabelas:

```text
clinica_medica_db
│
├── medico
│
├── paciente
│
├── convenio
│
└── agendamento
      ├── id_medico → medico.id
      └── id_paciente → paciente.id
```

Posteriormente, a estrutura é modificada para representar uma versão atualizada do sistema.

---

# 🏗️ Estrutura Inicial

A primeira parte do projeto cria o banco de dados e suas tabelas.

## 👨‍⚕️ Tabela `medico`

Armazena os dados dos médicos cadastrados na clínica.

| Campo           | Tipo         | Descrição                     |
| --------------- | ------------ | ----------------------------- |
| `id`            | INT          | Identificador único do médico |
| `nome`          | VARCHAR(120) | Nome do médico                |
| `crm`           | VARCHAR(20)  | Registro profissional         |
| `especialidade` | VARCHAR(80)  | Especialidade médica          |
| `telefone`      | VARCHAR(20)  | Telefone                      |
| `email`         | VARCHAR(120) | E-mail                        |

### Chave primária

```sql
id INT AUTO_INCREMENT PRIMARY KEY
```

O campo `id` identifica cada médico de forma única e é gerado automaticamente.

---

## 👤 Tabela `paciente`

Armazena os dados dos pacientes cadastrados na clínica.

| Campo             | Tipo         | Descrição                       |
| ----------------- | ------------ | ------------------------------- |
| `id`              | INT          | Identificador único do paciente |
| `nome`            | VARCHAR(120) | Nome do paciente                |
| `cpf`             | VARCHAR(15)  | CPF                             |
| `data_nascimento` | DATE         | Data de nascimento              |
| `rua`             | VARCHAR(250) | Rua do endereço                 |
| `numero`          | VARCHAR(10)  | Número do endereço              |
| `cidade`          | VARCHAR(250) | Cidade                          |
| `cep`             | VARCHAR(25)  | CEP                             |
| `telefone`        | VARCHAR(20)  | Telefone                        |
| `email`           | VARCHAR(120) | E-mail                          |

### Chave primária

```sql
id INT AUTO_INCREMENT PRIMARY KEY
```

---

## 🏷️ Tabela `convenio`

Armazena informações sobre convênios médicos.

| Campo          | Tipo         | Descrição                       |
| -------------- | ------------ | ------------------------------- |
| `id`           | INT          | Identificador único do convênio |
| `nome`         | VARCHAR(120) | Nome do convênio                |
| `registro_ans` | VARCHAR(20)  | Registro na ANS                 |
| `telefone`     | VARCHAR(20)  | Telefone do convênio            |

### Chave primária

```sql
id INT AUTO_INCREMENT PRIMARY KEY
```

> **Importante:** essa tabela faz parte da **estrutura inicial**. Durante a etapa de edição do banco, ela é removida através do comando `DROP TABLE convenio`.

---

## 📅 Tabela `agendamento`

Registra os agendamentos realizados na clínica.

| Campo         | Tipo         | Descrição                          |
| ------------- | ------------ | ---------------------------------- |
| `id`          | INT          | Identificador único do agendamento |
| `id_medico`   | INT          | Médico responsável                 |
| `id_paciente` | INT          | Paciente                           |
| `data_hora`   | DATETIME     | Data e horário                     |
| `sala`        | VARCHAR(250) | Sala do atendimento                |
| `valor`       | DOUBLE       | Valor do atendimento               |
| `observacoes` | TEXT         | Observações                        |

### Chave primária

```sql
id INT AUTO_INCREMENT PRIMARY KEY
```

### Chaves estrangeiras

Relacionamento com o médico:

```sql
FOREIGN KEY (id_medico) REFERENCES medico(id)
```

Relacionamento com o paciente:

```sql
FOREIGN KEY (id_paciente) REFERENCES paciente(id)
```

---

# 🔄 Edição do Banco de Dados

Após a criação da estrutura inicial, o projeto realiza alterações para atualizar o modelo do banco.

Essa etapa é o principal objetivo do exercício.

---

## 🗑️ 1. Exclusão da tabela `convenio`

A tabela de convênios é removida:

```sql
DROP TABLE convenio;
```

Isso elimina a tabela `convenio` da estrutura do banco.

---

## ➕ 2. Adição da coluna `convenio`

Uma nova coluna é adicionada diretamente à tabela `paciente`:

```sql
ALTER TABLE paciente
ADD COLUMN convenio VARCHAR(80) NULL;
```

A tabela `paciente` passa a armazenar diretamente o convênio do paciente.

### Estrutura adicionada

| Campo      | Tipo        | Permite `NULL` |
| ---------- | ----------- | -------------- |
| `convenio` | VARCHAR(80) | Sim            |

Essa alteração substitui a tabela independente `convenio` por uma coluna dentro de `paciente`.

---

## 🗑️ 3. Remoção da coluna `observacoes`

A coluna `observacoes` é removida da tabela `agendamento`:

```sql
ALTER TABLE agendamento
DROP COLUMN observacoes;
```

Após essa alteração, os agendamentos deixam de possuir esse campo.

---

## 💰 4. Alteração do tipo de `valor`

O tipo de dado da coluna `valor` é alterado:

```sql
ALTER TABLE agendamento
MODIFY COLUMN valor DECIMAL(10,2) NOT NULL;
```

Inicialmente:

```text
DOUBLE
```

Depois:

```text
DECIMAL(10,2)
```

O `DECIMAL(10,2)` é mais apropriado para representar valores monetários com duas casas decimais.

---

## 🏢 5. Renomeação da coluna `sala`

A coluna `sala` é renomeada para `consultorio`:

```sql
ALTER TABLE agendamento
RENAME COLUMN sala TO consultorio;
```

### Antes

```text
sala
```

### Depois

```text
consultorio
```

A alteração torna o nome do campo mais específico para o contexto da clínica.

---

## 🔄 6. Renomeação da tabela `agendamento`

A tabela `agendamento` é renomeada para `consulta`:

```sql
RENAME TABLE agendamento TO consulta;
```

### Antes

```text
agendamento
```

### Depois

```text
consulta
```

---

# 📊 Estrutura Final

Depois de todas as alterações, a estrutura do banco passa a ser:

```text
clinica_medica_db
│
├── medico
│
├── paciente
│     └── convenio
│
└── consulta
      ├── id_medico → medico.id
      └── id_paciente → paciente.id
```

A tabela `convenio` deixa de existir.

A tabela `agendamento` passa a se chamar `consulta`.

---

## 🧑‍⚕️ Relação entre Médico, Paciente e Consulta

A estrutura final pode ser representada da seguinte maneira:

```text
┌──────────────────┐
│      medico      │
├──────────────────┤
│ id (PK)          │
│ nome             │
│ crm              │
│ especialidade    │
│ telefone         │
│ email            │
└────────┬─────────┘
         │
         │ 1:N
         │
         ▼
┌──────────────────────┐
│       consulta       │
├──────────────────────┤
│ id (PK)              │
│ id_medico (FK)       │
│ id_paciente (FK)     │
│ data_hora            │
│ consultorio          │
│ valor                │
└──────────┬───────────┘
           │
           │ N:1
           ▼
┌──────────────────────┐
│      paciente        │
├──────────────────────┤
│ id (PK)              │
│ nome                 │
│ cpf                  │
│ data_nascimento      │
│ rua                  │
│ numero               │
│ cidade               │
│ cep                  │
│ telefone             │
│ email                │
│ convenio             │
└──────────────────────┘
```

### Relação `medico` → `consulta`

Um médico pode possuir várias consultas cadastradas.

### Relação `paciente` → `consulta`

Um paciente pode possuir várias consultas cadastradas.

### Relação `consulta` → `medico`

Cada consulta está associada a um médico.

### Relação `consulta` → `paciente`

Cada consulta está associada a um paciente.

---

# 🧱 Comandos DDL utilizados

O projeto é especialmente voltado para a prática de **DDL (Data Definition Language)**.

## `CREATE DATABASE`

Cria o banco:

```sql
CREATE DATABASE IF NOT EXISTS clinica_medica_db;
```

## `USE`

Seleciona o banco que será utilizado:

```sql
USE clinica_medica_db;
```

## `CREATE TABLE`

Cria as tabelas:

```sql
CREATE TABLE IF NOT EXISTS medico (...);
CREATE TABLE IF NOT EXISTS paciente (...);
CREATE TABLE IF NOT EXISTS convenio (...);
CREATE TABLE IF NOT EXISTS agendamento (...);
```

## `DROP TABLE`

Exclui uma tabela:

```sql
DROP TABLE convenio;
```

## `ALTER TABLE ... ADD COLUMN`

Adiciona uma coluna:

```sql
ALTER TABLE paciente
ADD COLUMN convenio VARCHAR(80) NULL;
```

## `ALTER TABLE ... DROP COLUMN`

Remove uma coluna:

```sql
ALTER TABLE agendamento
DROP COLUMN observacoes;
```

## `ALTER TABLE ... MODIFY COLUMN`

Modifica o tipo ou as propriedades de uma coluna:

```sql
ALTER TABLE agendamento
MODIFY COLUMN valor DECIMAL(10,2) NOT NULL;
```

## `ALTER TABLE ... RENAME COLUMN`

Renomeia uma coluna:

```sql
ALTER TABLE agendamento
RENAME COLUMN sala TO consultorio;
```

## `RENAME TABLE`

Renomeia uma tabela:

```sql
RENAME TABLE agendamento TO consulta;
```

---

# 📋 Resumo das alterações

| Alteração            | Antes                     | Depois              |
| -------------------- | ------------------------- | ------------------- |
| Tabela de convênio   | `convenio`                | Removida            |
| Convênio do paciente | Não existia               | `paciente.convenio` |
| Observações          | `agendamento.observacoes` | Removida            |
| Tipo de valor        | `DOUBLE`                  | `DECIMAL(10,2)`     |
| Sala                 | `sala`                    | `consultorio`       |
| Nome da tabela       | `agendamento`             | `consulta`          |

---

# ⚙️ Como executar

### 1. Pré-requisitos

É necessário possuir um servidor **MySQL** instalado e em execução.

Pode ser utilizado, por exemplo:

* MySQL Server
* MySQL Workbench
* XAMPP
* WAMP
* Laragon

### 2. Criação inicial

Execute a parte responsável pela criação:

```sql
CREATE DATABASE IF NOT EXISTS clinica_medica_db;

USE clinica_medica_db;
```

Depois, execute os comandos `CREATE TABLE`.

### 3. Aplicação das alterações

Com a estrutura inicial criada, execute os comandos de edição:

```sql
DROP TABLE convenio;

ALTER TABLE paciente
ADD COLUMN convenio VARCHAR(80) NULL;

ALTER TABLE agendamento
DROP COLUMN observacoes;

ALTER TABLE agendamento
MODIFY COLUMN valor DECIMAL(10,2) NOT NULL;

ALTER TABLE agendamento
RENAME COLUMN sala TO consultorio;

RENAME TABLE agendamento TO consulta;
```

> **Atenção:** a parte de edição depende da estrutura inicial existir. Por isso, os comandos de alteração não devem ser executados isoladamente em um banco vazio.

---

# 📁 Estrutura sugerida do projeto

```text
clinica-medica/
│
├── README.md
└── clinica_medica.sql
```

O arquivo `clinica_medica.sql` contém os comandos de criação e alteração da estrutura do banco.

---

# 🎯 Objetivo

O projeto tem como objetivo praticar **criação, alteração e evolução de bancos de dados relacionais**, utilizando SQL.

Os principais conceitos trabalhados são:

* Criação de banco de dados;
* Criação de tabelas;
* Chaves primárias;
* Chaves estrangeiras;
* `AUTO_INCREMENT`;
* `NOT NULL`;
* `ALTER TABLE`;
* Adição de colunas;
* Exclusão de colunas;
* Exclusão de tabelas;
* Alteração de tipos de dados;
* Renomeação de colunas;
* Renomeação de tabelas;
* Modelagem de banco de dados;
* Integridade referencial;
* DDL — Data Definition Language.

---

## 👨‍💻 Autor

**Davi Leonardo**

Projeto desenvolvido para fins de estudo e prática de **SQL, DDL, modelagem e gerenciamento de bancos de dados relacionais**.
