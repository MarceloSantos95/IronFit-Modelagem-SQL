# 💾 Projeto Final: Sistema de Gestão para Academia "IronFit"

## 🎯 Objetivo do Projeto
Este repositório contém o Modelo Lógico (DDL) e os scripts de manipulação de dados (DML) para o Sistema de Gestão da Academia "IronFit". O modelo foi desenvolvido e normalizado até a Terceira Forma Normal (3FN).

## 🛠️ Requisitos de Ambiente
- **SGBD (Sistema Gerenciador de Banco de Dados):** MySQL (ou PostgreSQL, com pequenas adaptações na sintaxe de tipos de dados).
- **Ferramenta de Execução:** MySQL Workbench ou DBeaver.

## 📝 Scripts Incluídos

| Arquivo | Conteúdo | Propósito na Atividade 4 |
| :--- | :--- | :--- |
| `01_ddl_estrutura.sql` | CREATE DATABASE e CREATE TABLE | Cria a estrutura do banco de dados (Modelo Lógico). |
| `02_dml_insercao_dados.sql` | Comandos INSERT INTO | Povoa as 7 tabelas, respeitando a Integridade Referencial (FKs). |
| `03_dml_selects_consultas.sql` | Comandos SELECT (com JOIN, WHERE) | Demonstra consultas complexas para análise de negócio. |
| `04_dml_modificacao_final.sql` | Comandos UPDATE e DELETE | Demonstra manipulação de dados e respeito às regras de integridade. |

## ⚙️ Ordem de Execução (Passo a Passo)

1.  **Criação da Estrutura:** Execute o script `01_ddl_estrutura.sql`.
2.  **Inserção de Dados:** Execute o script `02_dml_insercao_dados.sql`.
3.  **Teste de Consultas:** Execute o script `03_dml_selects_consultas.sql`.
4.  **Teste de Integridade:** Execute o script `04_dml_modificacao_final.sql`.
