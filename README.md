
# Projeto de Exemplo de Banco de Dados - Consultas SQL

Este é um projeto de exemplo que demonstra a criação de tabelas e consultas SQL para um banco de dados fictício relacionado a informações de clientes, sessões de filmes e filmes. O projeto inclui definições de tabelas, comandos SQL e consultas para recuperar informações específicas.

## Estrutura do Banco de Dados

O banco de dados é composto por três tabelas principais:

### Tabela CLIENTE

- Colunas: `cd_cpf`, `nm_cliente`, `dt_nascimento`
- `cd_cpf` é a chave primária da tabela.

### Tabela SESSAO

- Colunas: `dt_assistido`, `idFILME`, `idCLIENTE`
- `dt_assistido` é a chave primária da tabela.
- `idFILME` e `idCLIENTE` são chaves estrangeiras que fazem referência às tabelas `FILME` e `CLIENTE`, respectivamente.

### Tabela FILME

- Colunas: `cd_filme`, `nm_genero`, `nm_filme`
- `cd_filme` é a chave primária da tabela.

## Exemplos de Consultas SQL

O projeto inclui exemplos de consultas SQL que podem ser executadas neste banco de dados fictício. Alguns exemplos de consultas são:

- Consulta para exibir informações sobre a estrutura da tabela `filme`.
- Consulta para inserir registros na tabela `filme`.
- Consulta para recuperar registros da tabela `filme`.
- Consulta para criar a tabela `cliente` e inserir registros nela.
- Consulta para recuperar registros da tabela `cliente`.
- Consulta para criar a tabela `sessao` e adicionar integridade referencial com as tabelas `cliente` e `filme`.
- Consulta para recuperar informações de sessões com base em critérios específicos, como intervalo de IDs de funcionários.
- Consulta para calcular médias, somas e contagens em consultas de grupo, incluindo exemplos com `HAVING`.
- Consulta para realizar junções entre tabelas usando `JOIN` com exemplos de tipos de junções como `NATURAL JOIN`, `INNER JOIN` e `USING`.
- Consulta para exibir informações relacionadas entre tabelas que não têm uma junção direta, mostrando como recuperar informações de empregados e suas cidades de trabalho.
- Consulta para filtrar registros com base em critérios, como nomes que começam com a letra "A", e ordenar os resultados.

## Como Utilizar

1. Clone este repositório em sua máquina local.
2. Execute os comandos SQL fornecidos em um sistema de gerenciamento de banco de dados que você esteja utilizando (por exemplo, MySQL, PostgreSQL, etc.).
3. Execute as consultas SQL em seu sistema de gerenciamento de banco de dados para visualizar os resultados.


---

Este README fornece informações sobre a estrutura do banco de dados, exemplos de consultas SQL e instruções para usar o projeto. Use-o como um guia para entender e explorar o projeto de exemplo de banco de dados.
