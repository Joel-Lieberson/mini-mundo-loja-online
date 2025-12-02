# Mini-mundo: Loja Online (SQL DML)

Este repositório contém scripts SQL para criação e manipulação de dados
em um banco relacional de uma **Loja Online**.

## 📌 Objetivo
- Criar o banco a partir do modelo lógico;
- Popular tabelas principais com INSERT;
- Realizar consultas SELECT (JOIN, WHERE, ORDER BY, LIMIT);
- Executar UPDATE e DELETE preservando integridade referencial.

## 🧰 Tecnologias
Compatível com:
- **MySQL 8+ (Workbench)**
- **PostgreSQL 13+ (PGAdmin)**

> Observação: tipos e comandos são SQL padrão.
> Pequenas diferenças (AUTO_INCREMENT vs SERIAL) já foram tratadas no script.

---

## ▶️ Como executar

### 1) Criar o banco e tabelas
Abra e rode:
`sql/01_schema.sql`

### 2) Inserir dados
Rode:
`sql/02_inserts.sql`

### 3) Consultas SELECT
Rode:
`sql/03_selects.sql`

### 4) UPDATEs e DELETEs
Rode:
`sql/04_updates_deletes.sql`

---

## 🗂️ Estrutura
- `01_schema.sql` → DDL (CREATE TABLE + constraints)
- `02_inserts.sql` → INSERTs para povoar o banco
- `03_selects.sql` → 2 a 5 consultas com SELECT
- `04_updates_deletes.sql` → ≥3 UPDATEs e ≥3 DELETEs (com condição)

---

## 📊 Diagrama lógico (resumo)
Entidades:
- Cliente
- Produto
- Pedido
- ItemPedido
- Pagamento

Relacionamentos:
- Cliente 1:N Pedido
- Pedido 1:N ItemPedido
- Produto 1:N ItemPedido
- Pedido 1:1 Pagamento

---

## 👤 Autor
Seu Nome Aqui
